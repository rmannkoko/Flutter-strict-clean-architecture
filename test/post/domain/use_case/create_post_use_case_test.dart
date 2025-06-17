import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/Post/domain/post_entity.dart';
import 'package:untitled/Post/domain/post_repository_interface.dart';
import 'package:untitled/Post/domain/use_case/command/create_post_use_case.dart';


class MockPostRepository extends Mock implements PostRepositoryInterface {}

void main() {
  late CreatePostUseCase createPostUseCase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    createPostUseCase = CreatePostUseCase(mockPostRepository);
  });


  test('doit créer un post', () async {
    const post = PostEntity(userId: 1, id: 1, title: 'title', body: 'body');
    when(() => mockPostRepository.createPost(post)).thenAnswer((_) async => post);
    final result = await createPostUseCase(post);
    expect(result, post);
  });
}
