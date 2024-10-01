import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pomo/repositories/authentication_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AuthenticationRepository authenticationRepository;

  AuthInterceptor({required this.authenticationRepository});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await authenticationRepository.getAccessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Attempt to refresh the token
      final refreshToken = await authenticationRepository.getRefreshToken;
      if (refreshToken != null) {
        final response = await authenticationRepository.refreshToken(refreshToken: refreshToken);
        if (response != null) {
          // Retry the failed request
          final accessToken = await authenticationRepository.getAccessToken;
          err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
          final clonedRequest = await dio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(clonedRequest);
        }
      }
    }
    return handler.next(err);
  }
}