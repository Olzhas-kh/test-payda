import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_payda/core/custom/error_text.dart';
import 'package:test_payda/core/custom/progress_indicator.dart';
import 'package:test_payda/core/get_it/injection_container.dart';
import 'package:test_payda/core/services/cash_service.dart';
import 'package:test_payda/feature/posts/logic/bloc/posts_bloc.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';
import 'package:test_payda/feature/posts/logic/data/repositories/posts_repositories.dart';
import 'package:test_payda/feature/posts/widgets/post_card.dart';

@RoutePage()
class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  String _searchQuery = '';
  late List<PostModel> _filteredPosts = [];
late CacheService _cacheService;

  @override
  void initState() {
    super.initState();
    _cacheService = CacheService();
  }
  Future<void> _refreshPosts(BuildContext context) async {
    context.read<PostsBloc>().add(GetPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => PostsBloc( sl<PostsRepository>(),_cacheService,)..add(GetPostsEvent()),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const CustomProgressIndicator();
            }
            if (state is PostsFailure) {
              return const CustomErrorText();
            }
            if (state is PostsSuccess) {
              _filteredPosts = state.response.where((post) {
                if (post.title != null) {
                  return post.title!
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase());
                }
                return false;
              }).toList();

              final postsToShow =
                  _searchQuery.isEmpty ? state.response : _filteredPosts;

              if (postsToShow.isEmpty) {
                return Center(
                  child: Text(
                    'No data available',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () => _refreshPosts(context),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: postsToShow.length,
                  itemBuilder: (context, index) {
                    return PostCard(post: postsToShow[index]);
                  },
                ),
              );
            }
            return const Offstage();
          },
        ),
      ),
    );
  }
}
