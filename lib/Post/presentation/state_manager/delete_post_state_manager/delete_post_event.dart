part of 'delete_post_bloc.dart';

sealed class DeletePostEvent extends Equatable {
  const DeletePostEvent();
  @override
  List<Object> get props => [];
}

class DeletePostRequested extends DeletePostEvent {
  final int id;
  const DeletePostRequested(this.id);
  @override
  List<Object> get props => [id];
}