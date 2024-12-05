
import 'package:cat_app_flutter/core/exceptions/failure.dart';

abstract interface class Validator<T> {
  Failure? validate({required T input});
}