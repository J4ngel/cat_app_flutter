
import 'package:cat_app_flutter/core/exceptions/regular_expression_failure.dart';
import 'package:cat_app_flutter/core/utils/constants/strings.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/base/value_object.dart';

abstract class BaseDto {
  final bool isLoading;

  const BaseDto([this.isLoading = false]);

  String? getErrorMessage<T>({
    required ValueObject<T> valueObject,
    String? notContainsUpperCaseLetterErrorMessage,
    String? notContainsLowerCaseLetterErrorMessage,
    String? invalidEmailMessage,
    String? defaultErrorMessage
  }){
      final error = valueObject.error;

      if(error == null) return null;

      final defaultMessage =
          defaultErrorMessage ?? Strings.I.genericError;

      final message = switch(error){
        NotContainsUpperCaseLetters() => notContainsUpperCaseLetterErrorMessage,
        NotContainsLowerCaseLetters() => notContainsLowerCaseLetterErrorMessage,
        InvalidEmail() => invalidEmailMessage,
        _ => defaultMessage
      };

      return message ?? defaultMessage;
  }
}