part of 'update_post_bloc.dart';

sealed class UpdatePostEvent extends Equatable {
  const UpdatePostEvent();
  @override
  List<Object> get props => [];
}

class UpdatePostRequested extends UpdatePostEvent {
  final PostEntity post;
  const UpdatePostRequested(this.post);
  @override
  List<Object> get props => [post];
}