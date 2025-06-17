import 'package:untitled/Post/domain/post_repository_interface.dart';

class DeletePostUseCase{
  final PostRepositoryInterface postRepositoryInterface;
  DeletePostUseCase(this.postRepositoryInterface);

  Future<bool> call(int id) async {
    return await postRepositoryInterface.deletePost(id);
  }
}