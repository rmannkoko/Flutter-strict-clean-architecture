import '../../post_entity.dart';
import '../../post_repository_interface.dart';

class UpdatePostUseCase{
  final PostRepositoryInterface postRepositoryInterface;
  UpdatePostUseCase(this.postRepositoryInterface);

  Future<PostEntity> call(PostEntity post) async {
    return await postRepositoryInterface.updatePost(post);
  }

}