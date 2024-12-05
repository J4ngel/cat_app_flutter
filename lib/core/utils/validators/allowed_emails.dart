import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/exceptions/regular_expression_failure.dart';
import 'package:cat_app_flutter/core/utils/regular_expressions.dart';
import 'package:cat_app_flutter/core/utils/validators/validator.dart';

final class AllowedEmailsValidator implements Validator<String> {
  @override
  Failure? validate({required String input}) {
    if(!RegularExpressions.identifyEmail.hasMatch(input)){
      return const InvalidEmail();
    }
    return null;
  }

}