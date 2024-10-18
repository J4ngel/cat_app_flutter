import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/exceptions/server_failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/user_repository.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/user_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class UserGateway implements UserRepository{
  UserGateway({required this.userRemoteDataSource});
  final UserRemoteDataSource userRemoteDataSource;
  
  @override
  Future<Either<bool, Failure>> createUser(UserEntity user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UserEntity, Failure>> getUser(String email, String phone) async {
    try {
      final request = await userRemoteDataSource.getUser('$email-$phone');
      return Left(request);

    }on ServerFailure{
      return Right(ServerFailure());
    }
  }
  
}