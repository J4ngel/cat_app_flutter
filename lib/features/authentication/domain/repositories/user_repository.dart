import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<UserEntity, Failure>> getUser(String email, String phone);

  Future<Either<bool, Failure>> createUser(UserEntity user);
}