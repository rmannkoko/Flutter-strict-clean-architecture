import 'package:flutter/material.dart';

import '../../domain/post_entity.dart';

class PostDetailScreen extends StatelessWidget {
  final PostEntity post;
  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.body, style: const TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
