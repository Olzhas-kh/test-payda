// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [PostDetailScreen]
class PostDetailRoute extends PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({
    Key? key,
    required PostModel? post,
    List<PageRouteInfo>? children,
  }) : super(
          PostDetailRoute.name,
          args: PostDetailRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'PostDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostDetailRouteArgs>();
      return PostDetailScreen(
        key: args.key,
        post: args.post,
      );
    },
  );
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({
    this.key,
    required this.post,
  });

  final Key? key;

  final PostModel? post;

  @override
  String toString() {
    return 'PostDetailRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [PostsScreen]
class PostsRoute extends PageRouteInfo<void> {
  const PostsRoute({List<PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostsScreen();
    },
  );
}
