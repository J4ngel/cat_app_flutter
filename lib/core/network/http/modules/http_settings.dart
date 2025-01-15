import 'package:cat_app_flutter/core/network/http/modules/http_base_settings.dart';
import 'package:cat_app_flutter/core/network/http/modules/http_timeouts.dart';
import 'package:cat_app_flutter/core/utils/constants/core_constants.dart';
import 'package:dio/dio.dart';


class HttpSettings extends BaseHttpSettings with InterceptorMixin, BaseOptionsMixin {
  factory HttpSettings.defaultConnection({required String baseUrl, bool showLogs = false}){
    final instance = HttpSettings(baseUrl: baseUrl);
    instance.defaultConnection();
    return instance;
  }

  factory HttpSettings.slowlyConnection({required String baseUrl, bool showLogs = false}){
    final instance = HttpSettings(baseUrl: baseUrl);
    instance.slowlyConnection();
    return instance;
  }

  HttpSettings({
    required this.baseUrl,
    this.showLogs = false,
    this.httpTimeouts = const HttpTimeouts(),
    this.contentType = CoreConstants.defaultRequestContentType,
    super.interceptors = const []
  }
      ) : super(
      baseOptions: BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType,
          connectTimeout: Duration(milliseconds: httpTimeouts.connectionTimeout),
          sendTimeout: Duration(milliseconds: httpTimeouts.sendTimeout),
          receiveTimeout: Duration(milliseconds: httpTimeouts.receiveTimeout)
      )
  ){
    _setUp();
  }

  final String baseUrl;
  final bool showLogs;
  final HttpTimeouts httpTimeouts;
  final String contentType;

  void _setUp() {
    if(showLogs) withLoggerInterceptor();
  }
}