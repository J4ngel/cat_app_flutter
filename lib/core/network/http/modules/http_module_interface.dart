import 'dart:convert';

import 'package:cat_app_flutter/core/network/http/modules/http_client.dart';
import 'package:dio/dio.dart';

typedef JSON = Map<String, dynamic>;
typedef RequestProgressCallback = void Function(int count, int total);

abstract class HttpModuleInterface {
  final HttpClient client;

  HttpModuleInterface(this.client);

  String get baseUrl => client.options.baseUrl;

  Future<JSON> get(String endpoint,{
    JSON? params,
    JSON? headers,
    RequestProgressCallback? onReceiveProgress
  }) async{
    final response = await _request<dynamic >(client.get(
        endpoint,
        queryParameters: params,
        options: _buildOptions(headers: headers),
        onReceiveProgress: onReceiveProgress
    ));

    return response;
  }

  Future<JSON> post(String endpoint,{
    JSON? params,
    JSON? headers,
    Object? body,
    RequestProgressCallback? onReceiveProgress,
    RequestProgressCallback? onSendProgress
  }) async{
    final response = await _request<dynamic >(client.post(
        endpoint,
        data: body,
        queryParameters: params,
        options: _buildOptions(headers: headers),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress
    ));

    return response;
  }

  Future<JSON> put(String endpoint,{
    JSON? params,
    JSON? headers,
    Object? body,
    RequestProgressCallback? onReceiveProgress,
    RequestProgressCallback? onSendProgress
  }) async{
    final response = await _request<dynamic >(client.put(
        endpoint,
        data: body,
        queryParameters: params,
        options: _buildOptions(headers: headers),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress
    ));

    return response;
  }

  Future<JSON> delete(String endpoint,{
    JSON? params,
    JSON? headers,
    Object? body
  }) async{
    final response = await _request<dynamic >(client.delete(
        endpoint,
        data: body,
        queryParameters: params,
        options: _buildOptions(headers: headers)
    ));

    return response;
  }

  Options _buildOptions({JSON? headers}) {
    return Options(
      headers: headers
    );
  }

  JSON _responseParser(Response response) {
    late JSON resp;
    try{
      resp = jsonDecode(response.toString());
    }catch (_){}
    return resp;
  }

  Future<JSON> _request<T>(Future<Response<T>> request) async {
    try{
      final response = await request;
      return _responseParser(response);
    } on DioException catch (_){
      //TODO gestionar los errores de Dio.
      rethrow;
    }
  }
}