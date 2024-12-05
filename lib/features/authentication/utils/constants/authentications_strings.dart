import 'package:cat_app_flutter/core/utils/constants/strings.dart';

class AuthenticationStrings extends Strings {
  const AuthenticationStrings._();

  static const AuthenticationStrings I = AuthenticationStrings._();

  String get login => 'Iniciar sesion';

  String get passwordNotContainsLowerOrUpperCaseLetters =>
      'la contraseña debe tener mayusculas y minusculas';

  String get invalidEmailString => 'Correo invalido, verifique sus datos de entrada';
}