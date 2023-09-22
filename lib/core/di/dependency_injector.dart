import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:carpeta_ciudadana/core/interceptors/interceptor_manager.dart';
import 'package:carpeta_ciudadana/features/register/data/datasources/register_remote_data_source.dart';
import 'package:carpeta_ciudadana/features/register/data/repositories/register_repository_impl.dart';
import 'package:carpeta_ciudadana/features/register/domain/repositories/register_repository.dart';
import 'package:carpeta_ciudadana/features/register/domain/usecases/register_user.dart';
import 'package:carpeta_ciudadana/features/register/presentation/bloc/register_bloc.dart';
import 'package:carpeta_ciudadana/features/signin/data/datasources/sign_in_remote_datasource.dart';
import 'package:carpeta_ciudadana/features/signin/data/repositories/sign_in_repository_impl.dart';
import 'package:carpeta_ciudadana/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:carpeta_ciudadana/features/signin/domain/usecases/sign_in_user.dart';
import 'package:carpeta_ciudadana/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';
import 'package:carpeta_ciudadana/core/http/dio_client_mix.dart';
import 'package:carpeta_ciudadana/core/http/http_retry.dart';
import 'package:carpeta_ciudadana/core/http/refresh_token.dart';
import 'package:carpeta_ciudadana/features/file/data/datasources/file_local_data_source.dart';
import 'package:carpeta_ciudadana/features/file/data/datasources/file_remote_data_source.dart';
import 'package:carpeta_ciudadana/features/file/data/repositories/file_repository_impl.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/select_file.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/upload_file.dart';
import 'package:carpeta_ciudadana/features/file/presentation/bloc/file_bloc.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    ///Features
    ///Signin
    //Bloc
    sl.registerFactory(() => SignInBloc(signInUser: sl()));

    //Usecases
    sl.registerLazySingleton(() => SignInUser(repository: sl()));

    //Repository
    sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImplementation(
        signinRemoteDataSource: sl(),
      ),
    );

    //Data
    sl.registerLazySingleton<SignInRemoteDataSource>(
      () => SignInRemoteDataSourceImpl(client: sl()),
    );

    ///Register
    //Bloc
    sl.registerFactory(() => RegisterBloc(registerUser: sl()));

    //Usecases
    sl.registerLazySingleton(() => RegisterUser(repository: sl()));

    //Repository
    sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImplementation(
        registerRemoteDataSource: sl(),
      ),
    );

    //Data
    sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(client: sl()),
    );

    ///File
    //Bloc
    sl.registerFactory(() => FileBloc(
          selectFile: sl(),
          uploadFile: sl(),
        ));

    //Usecases
    sl.registerLazySingleton(() => SelectFile(repository: sl()));
    sl.registerLazySingleton(() => UploadFile(repository: sl()));

    //Repository
    sl.registerLazySingleton<FileRepository>(
      () => FileRepositoryImpl(
        fileLocalDataSource: sl(),
        fileRemoteDataSource: sl(),
      ),
    );

    //Data
    sl.registerLazySingleton<FileRemoteDataSource>(
      () => FileRemoteDataSourceImpl(client: sl()),
    );
    sl.registerLazySingleton<FileLocalDataSource>(FileLocalDataSourceImpl.new);

    ///Core
    //Dio
    sl.registerLazySingleton(Dio.new);
    sl.registerLazySingleton(() => DioClientMix(client: sl()));
    sl.registerLazySingleton<CustomHttpClient>(
      () => CustomHttpClientImpl(clientMix: sl()),
    );

    //Http
    sl.registerLazySingleton<HttpRetry>(() => HttpRetryImpl(client: sl()));
    sl.registerLazySingleton<RefreshToken>(() => RefreshTokenImpl(
          client: sl(),
        ));

    //Interceptor Manager
    sl.registerSingletonAsync(() async => InterceptorManager(
          dioClientMix: sl(),
          // secureStorage: sl(),
          httpRetry: sl(),
          refreshToken: sl(),
        ));
  }
}
