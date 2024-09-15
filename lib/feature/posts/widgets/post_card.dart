import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_payda/core/routes/app_router.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';

class PostCard extends StatelessWidget {
  final PostModel? post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.pushRoute(PostDetailRoute(post: post));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: isDarkMode ? Colors.indigo.shade700 : Colors.indigo.shade100,
                    radius: 20,
                    child: Icon(
                      Icons.article,
                      color: isDarkMode ? Colors.white : Colors.indigo,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      post?.title ?? 'No title',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                post?.body ?? 'No content available',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: isDarkMode ? Colors.white60 : Colors.black54,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Read more',
                    style: TextStyle(
                      color: isDarkMode ? Colors.indigo.shade300 : Colors.indigo.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: isDarkMode ? Colors.indigo.shade300 : Colors.indigo,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
