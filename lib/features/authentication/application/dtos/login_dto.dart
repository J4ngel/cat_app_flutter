import 'package:cat_app_flutter/features/authentication/utils/constants/authentications_strings.dart';
import 'package:cat_app_flutter/shared/aplication/dtos/base_dto.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/email_value_object.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/password_value_object.dart';

final class LoginDto extends BaseDto {
  const LoginDto({
    required this.email,
    required this.password
  });

  LoginDto.empty() : this(
    email: EmailValueObject(''),
    password: PasswordValueObject('')
  );

  final EmailValueObject email;
  final PasswordValueObject password;

  LoginDto copyWith ({
    EmailValueObject? email,
    PasswordValueObject? password
}) =>
      LoginDto(
          email: email ?? this.email,
          password: password ?? this.password
      );

  String? get passwordError {
    return getErrorMessage(
        valueObject: password,
        notContainsLowerCaseLetterErrorMessage: AuthenticationStrings.I.
          passwordNotContainsLowerOrUpperCaseLetters,
        notContainsUpperCaseLetterErrorMessage: AuthenticationStrings.I.
          passwordNotContainsLowerOrUpperCaseLetters
    );
  }

  String? get emailError {
    return getErrorMessage(
      valueObject: email,
      invalidEmailMessage: AuthenticationStrings.I.invalidEmailString
    );
  }
}