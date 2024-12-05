import 'package:flutter/cupertino.dart';

abstract interface class Failure implements Exception {
  factory Failure([String? code, String? message]) => _Failure(code: code, message: message);

  void logging();
}

final class _Failure implements Failure {
  final String? message;
  final String? code;

  const _Failure({this.code, this.message});

  @override
  void logging(){
    debugPrint('Exception: $code, $message');
  }
}