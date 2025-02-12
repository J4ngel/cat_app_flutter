import 'package:cat_app_flutter/config/environment/environment.dart';
import 'package:cat_app_flutter/core/network/http/implementations/http_module.dart';
import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/application/bloc/welcome/welcome_bloc.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/cat_image_repository.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/user_repository.dart';
import 'package:cat_app_flutter/features/authentication/domain/use_cases/get_cat_image_use_case.dart';
import 'package:cat_app_flutter/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/implementations/remote/get_image_cat_data_source_impl.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/implementations/remote/user_remote_data_source_impl.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/get_image_cat_data_source.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/user_remote_data_source.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/gateways/cat_image_gateway.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/gateways/user_gateway.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializer() async {
  // Environments variables and configuration
  serviceLocator.registerFactory<Environment>(() => Environment(
      baseUrl: 'https://api.thecatapi.com/',
      showLogs: true
  ));

  // Modules
  serviceLocator.registerLazySingleton<HttpModule>(()=>HttpModule.catModule(environment: serviceLocator.get<Environment>()));

  // bloc
  serviceLocator.registerFactory<WelcomeBloc>(() => WelcomeBloc(getUserUseCase: serviceLocator.get<GetUserUseCase>()));
  serviceLocator.registerFactory<LoginBloc>(()=> LoginBloc(getCatImageUseCase: serviceLocator.get<GetCatImageUseCase>()));

  //use cases
  serviceLocator.registerLazySingleton<GetUserUseCase>(()=> GetUserUseCase(userRepository: serviceLocator<UserRepository>()));
  serviceLocator.registerLazySingleton<GetCatImageUseCase>(()=>GetCatImageUseCase(catImageRepository: serviceLocator<CatImageRepository>()));

  //repositories
  serviceLocator.registerLazySingleton<UserRepository>(() => UserGateway(userRemoteDataSource: serviceLocator<UserRemoteDataSource>()));
  serviceLocator.registerLazySingleton<CatImageRepository>(() => CatImageGateway(getImageCatDataSource: serviceLocator<GetImageCatDataSource>()));

  //data sources
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
  
  serviceLocator.registerLazySingleton<GetImageCatDataSource>(
      () => GetImageCatDataSourceImpl(httpModule: serviceLocator.get<HttpModule>())
  );
}