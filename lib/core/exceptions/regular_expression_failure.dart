import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:flutter/cupertino.dart';

final class RegularExpressionFailure implements Failure {
  final String? message;

  const RegularExpressionFailure([this.message]);

  @override
  void logging() {
    debugPrint('RegularExpressionFailure: $message');
  }
}

final class NotContainsUpperCaseLetters extends RegularExpressionFailure {
  const NotContainsUpperCaseLetters([super.message]);
}

final class NotContainsLowerCaseLetters extends RegularExpressionFailure {
  const NotContainsLowerCaseLetters([super.message]);
}

final class NotContainMinimumChars extends RegularExpressionFailure{
  const NotContainMinimumChars([super.message]);
}

final class InvalidEmail extends RegularExpressionFailure {
  const InvalidEmail([super.message]);
}