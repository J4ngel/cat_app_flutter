import 'package:cat_app_flutter/core/network/http/modules/http_client.dart';
import 'package:cat_app_flutter/core/network/http/modules/http_settings.dart';
import 'package:dio/dio.dart';
import 'package:dio/browser.dart';

HttpClientBrowser createClient(settings) => HttpClientBrowser(settings);

class HttpClientBrowser with DioMixin implements HttpClient {
  HttpClientBrowser(HttpSettings settings){
    options = settings.baseOptions;
    httpClientAdapter = BrowserHttpClientAdapter();
    interceptors.addAll(settings.interceptors);
  }
}