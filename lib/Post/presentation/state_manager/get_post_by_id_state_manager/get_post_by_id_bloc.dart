import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/post_entity.dart';
import '../../../domain/use_case/query/get_post_by_id_use_case.dart';

part 'get_post_by_id_event.dart';
part 'get_post_by_id_state.dart';

class GetPostByIdBloc extends Bloc<GetPostByIdEvent, GetPostByIdState> {
  final GetPostByIdUseCase getPostByIdUseCase;
  GetPostByIdBloc(this.getPostByIdUseCase) : super(GetPostByIdInitial()) {
    on<GetPostByIdRequested>((event, emit) async{
      emit(GetPostByIdLoading());
      try {
        final post = await getPostByIdUseCase(event.id);
        emit(GetPostByIdSuccess(post));
      } catch (e) {
        emit(GetPostByIdFailure(e.toString()));
      }
    });
  }
}
