import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/post_entity.dart';
import '../screens/post_detail_screen.dart';
import '../state_manager/delete_post_state_manager/delete_post_bloc.dart';

class PostItemWidget extends StatelessWidget {
  final PostEntity post;
  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Column(
        children: [
          ListTile(
            title: Text(post.title),
            subtitle: Text(
              post.body,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PostDetailScreen(post: post),
                  ));
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue,),
                onPressed: () {
                  // Handle edit action
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red,),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title:  const Text('Confirmer la suppression'),
                        content: const Text('Voulez-vous vraiment supprimer ce post ?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Annuler'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              context.read<DeletePostBloc>().add(DeletePostRequested(post.id));
                            },
                            child: const Text('Supprimer', style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      )
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


