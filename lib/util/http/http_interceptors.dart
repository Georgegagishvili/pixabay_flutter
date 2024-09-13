import 'dart:developer';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      '🔥 Request: ${options.uri}\n'
      'Method: ${options.method}\n'
      'Headers: ${options.headers}\n'
      'Body: ${options.data}',
      name: 'HTTP',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '🟢 Response: ${response.requestOptions.uri}\n'
      'Status code: ${response.statusCode}\n'
      'Headers: ${response.headers}\n'
      'Body: ${response.data}',
      name: 'HTTP',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      '🔴 Error: ${err.requestOptions.uri}\n'
      'Error: ${err.error}\n'
      'Error message: ${err.message}',
      name: 'HTTP',
    );
    handler.next(err);
  }
}
