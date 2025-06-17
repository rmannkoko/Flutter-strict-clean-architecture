import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_case/command/delete_post_use_case.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  final DeletePostUseCase deletePostUseCase;
  DeletePostBloc(this.deletePostUseCase) : super(DeletePostInitial()) {
    on<DeletePostRequested>((event, emit) async{
      emit(DeletePostLoading());
      try {
        await deletePostUseCase(event.id);
        emit(DeletePostSuccess());
      } catch (e) {
        emit(DeletePostFailure(e.toString()));
      }
    });
  }
}
