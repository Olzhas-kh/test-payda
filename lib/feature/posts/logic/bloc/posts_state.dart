part of 'posts_bloc.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsSuccess extends PostsState {
  final List<PostModel> response;

  PostsSuccess(this.response);
}

class PostsFailure extends PostsState {
  final Response response;

  PostsFailure(this.response);
}
