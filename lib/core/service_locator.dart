import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Post/data/datasource/remote/query/get_post_by_id_remote_datasource.dart';
import 'package:untitled/Post/domain/use_case/query/get_post_by_id_use_case.dart';

import '../Post/data/datasource/remote/command/create_post_remote_datasource.dart';
import '../Post/data/datasource/remote/command/delete_post_remote_datasource.dart';
import '../Post/data/datasource/remote/command/update_post_remote_datasource.dart';
import '../Post/data/datasource/remote/query/get_post_remote_datasource.dart';
import '../Post/data/post_repository_implementation.dart';
import '../Post/domain/post_repository_interface.dart';
import '../Post/domain/use_case/command/create_post_use_case.dart';
import '../Post/domain/use_case/command/delete_post_use_case.dart';
import '../Post/domain/use_case/command/update_post_use_case.dart';
import '../Post/domain/use_case/query/get_post_use_case.dart';
import '../Post/presentation/state_manager/create_post_state_manager/create_post_bloc.dart';
import '../Post/presentation/state_manager/delete_post_state_manager/delete_post_bloc.dart';
import '../Post/presentation/state_manager/get_post_by_id_state_manager/get_post_by_id_bloc.dart';
import '../Post/presentation/state_manager/get_post_state_manager/get_post_bloc.dart';
import '../Post/presentation/state_manager/update_post_state_manager/update_post_bloc.dart';


final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton(() => http.Client());
  // Data Sources
  sl.registerLazySingleton<GetPostRemoteDataSource>(() => GetPostRemoteDataSource(sl()));
  sl.registerLazySingleton<GetPostByIdRemoteDatasource>(() => GetPostByIdRemoteDatasource(sl()));
  sl.registerLazySingleton<CreatePostRemoteDatasource>(() => CreatePostRemoteDatasource(sl()));
  sl.registerLazySingleton<UpdatePostRemoteDataSource>(() => UpdatePostRemoteDataSource(sl()));
  sl.registerLazySingleton<DeletePostRemoteDataSource>(() => DeletePostRemoteDataSource(sl()));
  sl.registerLazySingleton<PostRepositoryInterface>(() => PostRepositoryImplementation(
      getPostsRemoteDataSource: sl(),
      getPostByIdRemote: sl(),
      createPostRemoteDatasource: sl(),
      updatePostRemoteDataSource: sl(),
      deletePostRemoteDataSource: sl(),
  ));
  // Use Cases
  sl.registerLazySingleton(() => GetPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetPostByIdUseCase(sl()));
  sl.registerLazySingleton(() => CreatePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  // Bloc
  sl.registerLazySingleton(() => GetPostBloc(sl()));
  sl.registerLazySingleton(() => DeletePostBloc(sl()));
  sl.registerLazySingleton(() => CreatePostBloc(sl()));
  sl.registerLazySingleton(() => UpdatePostBloc(sl()));
  sl.registerLazySingleton(() => GetPostByIdBloc(sl()));

}