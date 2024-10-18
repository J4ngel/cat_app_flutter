import 'package:cat_app_flutter/features/authentication/infrastructure/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String id);
}