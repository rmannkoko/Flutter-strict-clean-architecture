import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/Post/domain/post_repository_interface.dart';
import 'package:untitled/Post/domain/use_case/command/delete_post_use_case.dart';


class MockPostRepository extends Mock implements PostRepositoryInterface {}

void main() {
  late DeletePostUseCase deletePostUseCase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    deletePostUseCase = DeletePostUseCase(mockPostRepository);
  });


  test('doit supprimer un post', () async {
    when(() => mockPostRepository.deletePost(1)).thenAnswer((_) async => true);
    final result = await deletePostUseCase(1);
    expect(result, true);
  });
}
