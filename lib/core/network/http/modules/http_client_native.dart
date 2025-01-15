import 'package:cat_app_flutter/core/network/http/modules/http_client.dart';
import 'package:cat_app_flutter/core/network/http/modules/http_settings.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

HttpClientNative createClient(settings) => HttpClientNative(settings);

class HttpClientNative with DioMixin implements HttpClient {
  HttpClientNative(HttpSettings settings){
    options = settings.baseOptions;
    httpClientAdapter = IOHttpClientAdapter();
    interceptors.addAll(settings.interceptors);
  }
}