import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/post_entity.dart';
import '../../../domain/use_case/command/create_post_use_case.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostUseCase createPostUseCase;

  CreatePostBloc(this.createPostUseCase) : super(CreatePostInitial()) {
    on<CreatePostRequested>((event, emit) async{
      emit(CreatePostLoading());
      try {
        final post = await createPostUseCase(event.post);
        emit(CreatePostSuccess(post));
      } catch (e) {
        emit(CreatePostFailure(e.toString()));
      }
    });
  }
}
