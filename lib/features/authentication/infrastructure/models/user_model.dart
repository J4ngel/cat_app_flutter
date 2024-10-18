import 'package:cat_app_flutter/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({
    required super.email,
    required super.birthdate,
    required super.phone,
    required this.id,
    super.name
  });
  
  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      email: json[_emailCodingKey],
      birthdate: DateTime.parse(json[_birthdayCodingKey]),
      phone: json[_phoneCodingKey],
      id: json[_idCodingKey],
      name: json[_nameCodingKey]
  );

  Map<String, dynamic> toMap()=>{
    _idCodingKey: id,
    _emailCodingKey: email,
    _birthdayCodingKey: birthdate,
    _phoneCodingKey: phone,
    _nameCodingKey: name
  };

  final String id;

  // coding keys
  static const String _idCodingKey = 'id';
  static const String _phoneCodingKey = 'phone';
  static const String _emailCodingKey = 'email';
  static const String _birthdayCodingKey = 'birthdate';
  static const String _nameCodingKey = 'name';
}