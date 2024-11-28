import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/application/bloc/welcome/welcome_bloc.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/user_repository.dart';
import 'package:cat_app_flutter/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/implementations/remote/user_remote_data_source_impl.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/user_remote_data_source.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/gateways/user_gateway.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializer() async {
  // bloc
  serviceLocator.registerFactory(() => WelcomeBloc(getUserUseCase: serviceLocator()));
  serviceLocator.registerFactory(()=> LoginBloc());

  //use cases
  serviceLocator.registerLazySingleton(()=> GetUserUseCase(userRepository: serviceLocator()));

  //repositories
  serviceLocator.registerLazySingleton<UserRepository>(() => UserGateway(userRemoteDataSource: serviceLocator()));

  //data sources
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
}