import '../../post_entity.dart';
import '../../post_repository_interface.dart';

class GetPostByIdUseCase{
  final PostRepositoryInterface postRepositoryInterface;
  GetPostByIdUseCase(this.postRepositoryInterface);

  Future<PostEntity> call(int id) async {
    return await postRepositoryInterface.getPostById(id);
  }

}