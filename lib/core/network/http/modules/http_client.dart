import 'package:cat_app_flutter/core/network/http/modules/http_client_native.dart'
  if(dart.library.js_interop) 'package:cat_app_flutter/core/network/http/modules/http_client_browser.dart'
  if(dart.library.html) 'package:cat_app_flutter/core/network/http/modules/http_client_browser.dart' show createClient;
import 'package:dio/dio.dart';

  abstract interface class HttpClient extends Dio {
    factory HttpClient(settings) => createClient(settings);
  }