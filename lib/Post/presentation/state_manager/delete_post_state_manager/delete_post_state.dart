part of 'delete_post_bloc.dart';

sealed class DeletePostState extends Equatable {
  const DeletePostState();
  @override
  List<Object> get props => [];
}

class DeletePostInitial extends DeletePostState {}
class DeletePostLoading extends DeletePostState {}
class DeletePostSuccess extends DeletePostState{}
class DeletePostFailure extends DeletePostState {
  final String error;

  const DeletePostFailure(this.error);

  @override
  List<Object> get props => [error];
}