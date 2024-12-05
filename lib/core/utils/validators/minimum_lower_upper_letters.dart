
import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/exceptions/regular_expression_failure.dart';
import 'package:cat_app_flutter/core/utils/regular_expressions.dart';
import 'package:cat_app_flutter/core/utils/validators/validator.dart';

final class MinimumLowerUpperLettersValidator implements Validator<String> {
  @override
  Failure? validate({required String input}) {
    if(!RegularExpressions.identifyMinimumLowerCase.hasMatch(input)){
      return const NotContainsLowerCaseLetters();
    }

    if(!RegularExpressions.identifyMinimumUpperCase.hasMatch(input)){
      return const NotContainsUpperCaseLetters();
    }

    return null;
  }

}