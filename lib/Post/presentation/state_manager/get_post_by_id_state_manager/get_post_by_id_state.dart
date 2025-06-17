part of 'get_post_by_id_bloc.dart';

sealed class GetPostByIdState extends Equatable {
  const GetPostByIdState();
  @override
  List<Object> get props => [];
}

class GetPostByIdInitial extends GetPostByIdState {}
class GetPostByIdLoading extends GetPostByIdState {}

class GetPostByIdSuccess extends GetPostByIdState {
  final PostEntity post;
  const GetPostByIdSuccess(this.post);
  @override
    List<Object> get props => [post];
}
class GetPostByIdFailure extends GetPostByIdState {
  final String error;

  const GetPostByIdFailure(this.error);

  @override
  List<Object> get props => [error];
}
