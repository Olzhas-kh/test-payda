part of 'detail_bloc_bloc.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailSuccess extends DetailState {
  final UserModel user;
  final List<CommentModel> comment;

  DetailSuccess(this.user, this.comment);
}

class DetailFailure extends DetailState {
  final Response? response;

  DetailFailure(this.response);
}
