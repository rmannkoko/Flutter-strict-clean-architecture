part of 'get_post_bloc.dart';

sealed class GetPostState extends Equatable {
  const GetPostState();
  @override
  List<Object> get props => [];
}

class GetPostInitial extends GetPostState {}
class GetPostLoading extends GetPostState {}
class GetPostSuccess extends GetPostState {
  final List<PostEntity> posts;

  const GetPostSuccess(this.posts);

  @override
  List<Object> get props => [posts];
}
class GetPostFailure extends GetPostState {
  final String error;
  const GetPostFailure(this.error);
  @override
  List<Object> get props => [error];

}