import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/Post/domain/post_entity.dart';
import 'package:untitled/Post/domain/post_repository_interface.dart';
import 'package:untitled/Post/domain/use_case/query/get_post_use_case.dart';


class MockPostRepository extends Mock implements PostRepositoryInterface {}

void main() {
  late GetPostsUseCase getPostsUseCase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostsUseCase = GetPostsUseCase(mockPostRepository);
  });

  final testPosts = [
    const PostEntity(id: 1, userId: 1, title: 'Test', body: 'Test'),
    const PostEntity(id: 2, userId: 1, title: 'Test 2', body: 'Body 2'),
  ];

  test('Doit retourner une liste de posts depuis le repository', () async {
    // arrange
    when(() => mockPostRepository.getPosts())
        .thenAnswer((_) async => testPosts);

    // act
    final result = await getPostsUseCase();

    // assert
    expect(result, testPosts);
    verify(() => mockPostRepository.getPosts()).called(1);
    verifyNoMoreInteractions(mockPostRepository);
  });
}
