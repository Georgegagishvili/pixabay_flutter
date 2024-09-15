import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mvvm/src/util/exports.dart';
import 'package:retry/retry.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  late Dio _client;

  factory HttpService() {
    return _instance;
  }

  HttpService._internal() {
    _client = Dio(
      BaseOptions(
        baseUrl: Constants.HOST,
      ),
    );
    _client.interceptors.add(LoggingInterceptor());
    _client.interceptors.add(QueryApiKeyInterceptor(Constants.API_KEY));
  }

  static HttpService get instance => _instance;

  Map<String, String> get providerHeader => {
        'Content-Type': 'application/json',
      };

  Map<String, String> get userHeader => {
        'Authorization':
            Preferences.instance.getString(PreferenceKeys.USER_TOKEN) ?? '',
      };

  Future<Response> get(
    String path, {
    String baseUrl = Constants.HOST,
    bool isPrivate = false,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final url = _handleQueryParameters(
      Uri.parse('$baseUrl/$path'),
      queryParameters,
    );

    final mergedHeaders = {
      if (isPrivate) ...userHeader,
      ...providerHeader,
      ...?headers,
    };

    final response = await retry(
      () async => _client.get(
        url,
        options: Options(
          headers: mergedHeaders,
        ),
      ),
      retryIf: (e) => e is SocketException,
    );

    return response;
  }

  Future<Response> post(
    String path, {
    String baseUrl = Constants.HOST,
    bool isPrivate = false,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
  }) async {
    final url = _handleQueryParameters(
      Uri.parse('$baseUrl/$path'),
      queryParameters,
    );

    final encodedBody = jsonEncode(body);
    final mergedHeaders = {
      if (isPrivate) ...userHeader,
      ...providerHeader,
      ...?headers,
    };

    final response = await retry(
      () => _client.post(
        url,
        data: encodedBody,
        options: Options(
          headers: mergedHeaders,
        ),
      ),
      retryIf: (e) => e is SocketException,
    );

    return response;
  }

  Future<Response> put(
    String path, {
    String baseUrl = Constants.HOST,
    bool isPrivate = false,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
  }) async {
    final url = _handleQueryParameters(
      Uri.parse('$baseUrl/$path'),
      queryParameters,
    );
    final encodedBody = jsonEncode(body);
    final mergedHeaders = {
      if (isPrivate) ...userHeader,
      ...providerHeader,
      ...?headers,
    };

    final response = await retry(
      () => _client.put(
        url,
        data: encodedBody,
        options: Options(
          headers: mergedHeaders,
        ),
      ),
      retryIf: (e) => e is SocketException,
    );

    return response;
  }

  Future<Response> delete(
    String path, {
    String baseUrl = Constants.HOST,
    bool isPrivate = false,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
  }) async {
    final url = _handleQueryParameters(
      Uri.parse('$baseUrl/$path'),
      queryParameters,
    );
    final mergedHeaders = {
      if (isPrivate) ...userHeader,
      ...providerHeader,
      ...?headers,
    };
    final encodedBody = jsonEncode(body);

    final response = await retry(
      () => _client.delete(
        url,
        data: encodedBody,
        options: Options(
          headers: mergedHeaders,
        ),
      ),
      retryIf: (e) => e is SocketException,
    );

    return response;
  }

  void dispose() {
    _client.close();
  }

  String _handleQueryParameters(Uri url, Map<String, String>? queryParameters) {
    if (queryParameters != null) {
      url = url.replace(
        queryParameters: {...url.queryParameters, ...queryParameters},
      );
    }

    return url.toString();
  }
}
