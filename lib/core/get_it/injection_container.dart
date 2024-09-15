import 'package:get_it/get_it.dart';
import 'package:test_payda/feature/post_detail/logic/bloc/detail_bloc_bloc.dart';
import 'package:test_payda/feature/post_detail/logic/data/datasources/detail_datasources.dart';
import 'package:test_payda/feature/post_detail/logic/data/repositories/detail_repositories.dart';
import 'package:test_payda/feature/posts/logic/bloc/posts_bloc.dart';
import 'package:test_payda/feature/posts/logic/data/datasources/posts_datasource.dart';
import 'package:test_payda/feature/posts/logic/data/repositories/posts_repositories.dart';

var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<PostsBloc>(() => PostsBloc(sl(),sl()));

  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(sl()));

  sl.registerLazySingleton<PostsDataSource>(() => PostsDataSourceImpl());

  sl.registerFactory<DetailBloc>(() => DetailBloc(sl()));

  sl.registerLazySingleton<DetailRepository>(() => DetailRepositoryImpl(sl()));

  sl.registerLazySingleton<DetailDataSource>(() => DetailDataSourceImpl());
}
