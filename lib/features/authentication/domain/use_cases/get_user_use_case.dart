import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:cat_app_flutter/features/authentication/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase {
  GetUserUseCase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<UserEntity, Failure>> call(String email, String phone){
    return userRepository.getUser(email, phone);
  }
}