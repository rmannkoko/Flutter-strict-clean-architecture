import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/Post/domain/post_entity.dart';
import 'package:untitled/Post/domain/post_repository_interface.dart';
import 'package:untitled/Post/domain/use_case/query/get_post_by_id_use_case.dart';


class MockPostRepository extends Mock implements PostRepositoryInterface {}

void main() {
  late GetPostByIdUseCase getPostByIdUseCase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostByIdUseCase = GetPostByIdUseCase(mockPostRepository);
  });


  test('doit retourner un post par id depuis le repository', () async {
    const post = PostEntity(userId: 1, id: 1, title: 'title', body: 'body');
    when(() => mockPostRepository.getPostById(1)).thenAnswer((_) async => post);
    final result = await getPostByIdUseCase(1);
    expect(result, post);
  });
}
