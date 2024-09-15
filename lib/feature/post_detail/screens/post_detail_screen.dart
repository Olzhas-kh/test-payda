import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_payda/core/custom/error_text.dart';
import 'package:test_payda/core/custom/progress_indicator.dart';
import 'package:test_payda/core/extensions/num_extension.dart';
import 'package:test_payda/core/get_it/injection_container.dart';
import 'package:test_payda/feature/post_detail/logic/bloc/detail_bloc_bloc.dart';
import 'package:test_payda/feature/post_detail/logic/data/models/comment_model.dart';
import 'package:test_payda/feature/post_detail/widgets/card_detail_widget.dart';
import 'package:test_payda/feature/post_detail/widgets/comments_widget.dart';
import 'package:test_payda/feature/post_detail/widgets/user_info_widget.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';

@RoutePage()
class PostDetailScreen extends StatefulWidget {
  final PostModel? post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Detail"),
      ),
      body: BlocProvider(
        create: (context) => sl<DetailBloc>()
          ..add(GetDetailEvent(
            userid: widget.post?.userId ?? 0,
            postId: widget.post?.id ?? 0,
          )),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoading) {
              return const CustomProgressIndicator();
            }
            if (state is DetailFailure) {
              return const CustomErrorText();
            }
            if (state is DetailSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoWidget(
                        name: state.user.name ?? '',
                        company: state.user.company?.name ?? '',
                        email: state.user.email ?? '',
                        phone: state.user.phone ?? '',
                      ),
                      8.height,
                      CardDetailWidget(
                        title: widget.post?.title ?? '',
                        body: widget.post?.body ?? '',
                      ),
                      16.height,
                      ElevatedButton(
                        onPressed: () {
                          _showComments(context, state.comment);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Комментарии',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Offstage();
          },
        ),
      ),
    );
  }

  void _showComments(BuildContext context, List<CommentModel> comments) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return CommentsWidget(comments: comments,
        );
      },
    );
  }
}
