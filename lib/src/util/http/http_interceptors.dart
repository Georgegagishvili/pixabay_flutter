import 'dart:developer';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      '\n'
      '🔥 Request: ${options.uri}\n'
      '🔥 Method: ${options.method}\n'
      '🔥 Headers: ${options.headers}\n'
      '🔥 Body: ${options.data}'
      '\n',
      name: 'HTTP',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '\n'
      '🟢 Response: ${response.requestOptions.uri}\n'
      '🟢 Status code: ${response.statusCode}\n'
      '🟢 Body: ${response.data}'
      '\n',
      name: 'HTTP',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      '\n'
      '🔴 Error: ${err.requestOptions.uri}\n'
      '🔴 Error: ${err.error}\n'
      '🔴 Error message: ${err.message}'
      '\n',
      name: 'HTTP',
    );
    handler.next(err);
  }
}


class QueryApiKeyInterceptor extends Interceptor {
  final String apiKey;

  QueryApiKeyInterceptor(this.apiKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters = {
      ...options.queryParameters,
      'key': apiKey,
    };
    handler.next(options);
  }
}