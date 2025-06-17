import '../../post_entity.dart';
import '../../post_repository_interface.dart';

class GetPostsUseCase {
  final PostRepositoryInterface postRepositoryInterface;
  GetPostsUseCase(this.postRepositoryInterface);

  Future<List<PostEntity>> call() async {
    return await postRepositoryInterface.getPosts();
  }

}