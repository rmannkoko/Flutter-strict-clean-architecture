part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class CreatePostRequested extends CreatePostEvent {
  final PostEntity post;
  const CreatePostRequested(this.post);

  @override
  List<Object> get props => [post];

}