import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service_locator.dart';
import '../state_manager/delete_post_state_manager/delete_post_bloc.dart';
import '../state_manager/get_post_state_manager/get_post_bloc.dart';
import '../widgets/post_item_widget.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPostBloc>(
          create: (_) =>
          GetPostBloc(sl())
            ..add(GetPostRequested()),
        ),
        BlocProvider<DeletePostBloc>(
          create: (_) => DeletePostBloc(sl()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Posts'),),
        body: BlocListener<DeletePostBloc, DeletePostState>(
          listener: (context, state) {
            if (state is DeletePostSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post deleted successfully')),
              );
              context.read<GetPostBloc>().add(GetPostRequested());
            } else if (state is DeletePostFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error deleting post: ${state.error}')),
              );
            }
          },
          child: BlocBuilder<GetPostBloc, GetPostState>(
              builder: (context, state) {
                if (state is GetPostLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetPostSuccess) {
                  return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) =>
                          PostItemWidget(post: state.posts[index])
                  );
                } else if (state is GetPostFailure) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox();
              }
          ),
        ),
      ),
    );
  }
}
