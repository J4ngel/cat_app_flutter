import 'package:cat_app_flutter/config/environment/environment.dart';
import 'package:cat_app_flutter/core/network/http/modules/http_client.dart';
import 'package:cat_app_flutter/core/network/http/modules/http_module_interface.dart';
import 'package:cat_app_flutter/core/network/http/modules/http_settings.dart';
import 'package:dio/dio.dart';

final class HttpModule extends HttpModuleInterface{
  factory HttpModule.catModule({
      required Environment environment,
      List<Interceptor> interceptors = const []}){
    HttpSettings settings = HttpSettings(
        baseUrl: environment.baseUrl,
        showLogs: true,
        interceptors: interceptors
    );

    HttpClient client = HttpClient(settings);

    return HttpModule._(
        client,
        environment: environment,
        interceptors: interceptors
    );
  }

  HttpModule._(super.client, {required this.environment, this.interceptors});

  final Environment environment;
  final List<Interceptor>? interceptors;
}