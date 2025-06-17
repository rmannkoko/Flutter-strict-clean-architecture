part of 'update_post_bloc.dart';

sealed class UpdatePostState extends Equatable {
  const UpdatePostState();
  @override
  List<Object> get props => [];
}

class UpdatePostInitial extends UpdatePostState {}
class UpdatePostLoading extends UpdatePostState {}
class UpdatePostSuccess extends UpdatePostState {
  final PostEntity post;
  const UpdatePostSuccess(this.post);
  @override
    List<Object> get props => [post];
}
class UpdatePostFailure extends UpdatePostState {
  final String error;
  const UpdatePostFailure(this.error);
  @override
  List<Object> get props => [error];
}
