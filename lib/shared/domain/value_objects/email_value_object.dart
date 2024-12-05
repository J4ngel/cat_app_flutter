import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/utils/validators/allowed_emails.dart';
import 'package:cat_app_flutter/core/utils/validators/validator.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/base/value_object.dart';
import 'package:dartz/dartz.dart';

class EmailValueObject extends ValueObject<String> {
  factory EmailValueObject(String value) {
    return EmailValueObject._(EmailValueObject.validate(value));
  }

  EmailValueObject._(super.value);

  static Either<Failure, String> validate (String value){
    final List<Validator<String>> validators = [
      AllowedEmailsValidator()
    ];
    return ValueObject.executeValidators(value: value, validators: validators);
  }
}