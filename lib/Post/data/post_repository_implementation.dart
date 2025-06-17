import 'package:untitled/Post/data/datasource/remote/query/get_post_remote_datasource.dart';
import 'package:untitled/Post/data/post_model.dart';
import 'package:untitled/Post/domain/post_entity.dart';

import '../domain/post_repository_interface.dart';
import 'datasource/remote/command/create_post_remote_datasource.dart';
import 'datasource/remote/command/delete_post_remote_datasource.dart';
import 'datasource/remote/command/update_post_remote_datasource.dart';
import 'datasource/remote/query/get_post_by_id_remote_datasource.dart';

class PostRepositoryImplementation implements PostRepositoryInterface{
  final GetPostRemoteDataSource getPostsRemoteDataSource;
  final GetPostByIdRemoteDatasource getPostByIdRemote;
  final CreatePostRemoteDatasource createPostRemoteDatasource;
  final UpdatePostRemoteDataSource updatePostRemoteDataSource;
  final DeletePostRemoteDataSource deletePostRemoteDataSource;

  PostRepositoryImplementation({
    required this.getPostsRemoteDataSource,
    required this.getPostByIdRemote,
    required this.createPostRemoteDatasource,
    required this.updatePostRemoteDataSource,
    required this.deletePostRemoteDataSource,
  });

  @override
  Future<List<PostEntity>> getPosts() async {
    final posts = await getPostsRemoteDataSource.getPosts();
    return posts;
  }

  @override
  Future<PostEntity> getPostById(int id) async {
    final post = await getPostByIdRemote.getPostById(id);
    return post;
  }

  @override
  Future<PostEntity> createPost(PostEntity post) async {
    final postModel = post as PostModel;
    final newPost = await createPostRemoteDatasource.createPost(postModel);
    return newPost;
  }

  @override
  Future<PostEntity> updatePost(PostEntity post) async {
    final postModel = post as PostModel;
    final updatedPost = await updatePostRemoteDataSource.updatePost(postModel);
    return updatedPost;
  }

  @override
  Future<bool> deletePost(int id) async {
    final deleted = await deletePostRemoteDataSource.deletePost(id);
    return deleted;
  }
}