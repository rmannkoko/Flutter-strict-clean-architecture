import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/post_entity.dart';
import '../../../domain/use_case/query/get_post_use_case.dart';

part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final GetPostsUseCase getPostsUseCase;
  GetPostBloc(this.getPostsUseCase) : super(GetPostInitial()) {
    on<GetPostRequested>((event, emit) async{
      emit(GetPostLoading());
      try {
        final posts = await getPostsUseCase();
        emit(GetPostSuccess(posts));
      } catch (e) {
        emit(GetPostFailure(e.toString()));
      }
    });
  }
}
