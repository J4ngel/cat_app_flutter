import 'package:cat_app_flutter/core/utils/constants/core_constants.dart';
import 'package:dio/dio.dart';

class BaseHttpSettings {
  final BaseOptions baseOptions;
  final List<Interceptor> interceptors;

  BaseHttpSettings({required this.baseOptions, required this.interceptors});
}

mixin InterceptorMixin on BaseHttpSettings {
  void withLoggerInterceptor(){
    super.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}

mixin BaseOptionsMixin on BaseHttpSettings {
  void defaultConnection() {
    super.baseOptions.copyWith(
        connectTimeout: const Duration(
            milliseconds: CoreConstants.defaultRequestConnectionTimeout
        ),
        sendTimeout: const Duration(
          milliseconds: CoreConstants.defaultRequestSendTimeout
        ),
        receiveTimeout: const Duration(
          milliseconds: CoreConstants.defaultRequestReceiveTimeout
        )
    );
  }
  void slowlyConnection() {
    super.baseOptions.copyWith(
        connectTimeout: const Duration(
            milliseconds: CoreConstants.defaultSlowlyRequestConnectionTimeout
        ),
        sendTimeout: const Duration(
            milliseconds: CoreConstants.defaultSlowlyRequestSendTimeout
        ),
        receiveTimeout: const Duration(
            milliseconds: CoreConstants.defaultSlowlyRequestReceiveTimeout
        )
    );
  }
}