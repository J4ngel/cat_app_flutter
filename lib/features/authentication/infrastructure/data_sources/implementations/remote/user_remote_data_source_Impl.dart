import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/interfaces/remote/user_remote_data_source.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/models/user_model.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserModel> getUser(String id) {
    return Future.delayed(
      const Duration(milliseconds: 600),
        ()=>UserModel.fromMap(_mockData)
    );
  }

  final _mockData = {
    'id':'3041234566-jaime@correo.com',
    'email': 'jaime@correo.com',
    'name': 'Jaime Angel',
    'birthdate': DateTime.now().toString(),
    'phone': '3041234566'
  };
}