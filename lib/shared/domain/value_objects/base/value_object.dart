
import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/utils/validators/validator.dart';
import 'package:dartz/dartz.dart';

abstract class ValueObject<T> {
  final Either<Failure, T> value;

  const ValueObject(this.value);

  T? getOrNull(){
    return value.fold(
        (failure) => null,
        (result) => result
    );
  }

  T? getOrThrow(){
    return value.fold(
            (failure) => throw failure,
            (result) => result
    );
  }

  Failure? get error {
    return value.fold(
            (failure) => failure,
            (result) => null
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  static Either<Failure, T> executeValidators<T>({
    required T value,
    required List<Validator<T>> validators
  }){
    for(final validator in validators){
      final error = validator.validate(input: value);

      if (error != null) return Left(error);
    }
    return Right(value);
  }
}