import 'package:cat_app_flutter/core/exceptions/regular_expression_failure.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/password_value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main (){
  group('PasswordValueObject inputs test', (){
    test('When password not contains upper case value Should be Failure', (){
      // Arrange
      final input = 'contraseña';

      // Act
      final password = PasswordValueObject(input);
      final value = password.error;

      // Assert
      expect(value, isA<NotContainsUpperCaseLetters>());
    });

    test('When password not contains lower case value Should be Failure', (){
      // Arrange
      final input = 'CONTRASEÑA';

      // Act
      final password = PasswordValueObject(input);
      final value = password.error;

      // Assert
      expect(value, isA<NotContainsLowerCaseLetters>());
    });

    test('When password minimum 12 length Should be Failure', (){
      // Arrange
      final input = 'Ab1234567';

      // Act
      final password = PasswordValueObject(input);
      final value = password.error;

      // Assert
      expect(value, isA<NotContainMinimumChars>());
    });
  });
}