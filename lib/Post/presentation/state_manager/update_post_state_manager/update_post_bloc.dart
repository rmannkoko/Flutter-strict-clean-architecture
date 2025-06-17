import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/post_entity.dart';
import '../../../domain/use_case/command/update_post_use_case.dart';

part 'update_post_event.dart';
part 'update_post_state.dart';

class UpdatePostBloc extends Bloc<UpdatePostEvent, UpdatePostState> {
  final UpdatePostUseCase updatePostUseCase;
  UpdatePostBloc(this.updatePostUseCase) : super(UpdatePostInitial()) {
    on<UpdatePostRequested>((event, emit) async {
      emit(UpdatePostLoading());
      try {
        final post = await updatePostUseCase(event.post);
        emit(UpdatePostSuccess(post));
      } catch (e) {
        emit(UpdatePostFailure(e.toString()));
      }
    });
  }
}
