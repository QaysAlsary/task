import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/features/posts/data/datasources/post_local_data_source.dart';
import 'package:task_manager/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:task_manager/features/posts/data/repositories/post_repository_impl.dart';
import 'package:task_manager/features/posts/domain/repositories/posts_repository.dart';
import 'package:task_manager/features/posts/domain/usecases/add_post.dart';
import 'package:task_manager/features/posts/domain/usecases/delete_post.dart';
import 'package:task_manager/features/posts/domain/usecases/get_all_posts.dart';
import 'package:task_manager/features/posts/domain/usecases/update_post.dart';
import 'package:task_manager/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:task_manager/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:task_manager/src/core/network/network_info.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static setup() async {
    await _setupLocalStorage();
    _injectBlocProviders();
    _injectUseCases();
    _injectRepositories();
    _injectDataSources();
    _injectNetworkingDependencies();
  }



  static _injectBlocProviders() {

  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));
  }

  static _injectRepositories() {
    sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
        remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  }

  static _injectDataSources() async {
    sl.registerLazySingleton<PostRemoteDataSource>(
            () => PostRemoteDataSourceImpl(client: sl()));
    sl.registerLazySingleton<PostLocalDataSource>(
            () => PostLocalDataSourceImpl(sharedPreferences: sl()));
  }

  static _injectUseCases() {
    sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
    sl.registerLazySingleton(() => AddPostUsecase(sl()));
    sl.registerLazySingleton(() => DeletePostUsecase(sl()));
    sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
  }

  static _injectNetworkingDependencies() {
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }

  static Future _setupLocalStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }






}
