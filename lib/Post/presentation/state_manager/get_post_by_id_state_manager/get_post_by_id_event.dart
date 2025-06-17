part of 'get_post_by_id_bloc.dart';

sealed class GetPostByIdEvent extends Equatable {
  const GetPostByIdEvent();
  @override
  List<Object> get props => [];
}
class GetPostByIdRequested extends GetPostByIdEvent {
  final int id;
  const GetPostByIdRequested(this.id);
  @override
  List<Object> get props => [id];

}