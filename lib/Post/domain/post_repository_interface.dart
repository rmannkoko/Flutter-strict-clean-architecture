import 'package:untitled/Post/domain/post_entity.dart';

abstract class PostRepositoryInterface{

  Future<List<PostEntity>> getPosts() ;
  Future<PostEntity> getPostById(int id) ;
  Future<PostEntity> createPost(PostEntity post) ;
  Future<PostEntity> updatePost(PostEntity post) ;
  Future<bool> deletePost(int id) ;

}