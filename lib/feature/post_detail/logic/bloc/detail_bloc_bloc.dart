import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_payda/feature/post_detail/logic/data/models/comment_model.dart';
import 'package:test_payda/feature/post_detail/logic/data/models/user_model.dart';
import 'package:test_payda/feature/post_detail/logic/data/repositories/detail_repositories.dart';

part 'detail_bloc_event.dart';
part 'detail_bloc_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepository;
  DetailBloc(this.detailRepository) : super(DetailInitial()) {
    on<GetDetailEvent>(
      (event, emit) async {
        emit(DetailLoading());
        try {
          final UserModel getUser =
              await detailRepository.getUser(event.userid);
          final List<CommentModel> getComment =
              await detailRepository.getComment(event.postId);
          emit(DetailSuccess(getUser, getComment));
        } on DioException catch (e) {
          emit(DetailFailure(e.response));
        }
      },
    );
  }
}
