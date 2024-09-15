import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_payda/core/services/cash_service.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';
import 'package:test_payda/feature/posts/logic/data/repositories/posts_repositories.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final PostsRepository postsRepository;
  final CacheService _cacheService;
  PostsBloc(this.postsRepository,this._cacheService ) : super(PostsInitial()) {

    on<GetPostsEvent>(
      (event, emit) async {
        emit(PostsLoading());
        try {
          final List<PostModel> response = await postsRepository.getPosts();
          await _cacheService.savePosts(response);

          emit(PostsSuccess(response));
        } on DioException catch (e) {
        final cachedPosts = await _cacheService.getCachedPosts();
        if (cachedPosts.isNotEmpty) {
          emit( PostsSuccess(cachedPosts));
        } else {
          emit(PostsFailure(e.response?.data)) ;
        }
        }
      },
    );
  }
}
