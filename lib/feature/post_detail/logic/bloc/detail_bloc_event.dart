part of 'detail_bloc_bloc.dart';

abstract class DetailEvent {}

class GetDetailEvent extends DetailEvent {
  final int userid;
  final int postId;

  GetDetailEvent({required this.userid, required this.postId});
}
