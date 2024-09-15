import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_payda/feature/post_detail/screens/post_detail_screen.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';
import 'package:test_payda/feature/posts/screens/posts_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PostsRoute.page, initial: true),
        AutoRoute(page: PostDetailRoute.page),
      ];
}
