import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/Post/domain/post_entity.dart';
import 'package:untitled/Post/domain/post_repository_interface.dart';
import 'package:untitled/Post/domain/use_case/command/update_post_use_case.dart';


class MockPostRepository extends Mock implements PostRepositoryInterface {}

void main() {
  late UpdatePostUseCase updatePostUseCase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    updatePostUseCase = UpdatePostUseCase(mockPostRepository);
  });


  test('doit mettre à jour un post', () async {
    const post = PostEntity(userId: 1, id: 1, title: 'update', body: 'update');
    when(() => mockPostRepository.updatePost(post)).thenAnswer((_) async => post);
    final result = await updatePostUseCase(post);
    expect(result, post);
  });
}
