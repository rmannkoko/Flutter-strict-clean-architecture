import '../../post_entity.dart';
import '../../post_repository_interface.dart';

class CreatePostUseCase{
  final PostRepositoryInterface postRepositoryInterface;
  CreatePostUseCase(this.postRepositoryInterface);

  Future<PostEntity> call(PostEntity post) async {
    return await postRepositoryInterface.createPost(post);
  }
}