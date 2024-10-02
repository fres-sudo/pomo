import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pomo/constants/constants.dart';
import 'package:pomo/repositories/authentication_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AuthenticationRepository authenticationRepository;
  final Dio dio;

  AuthInterceptor({required this.authenticationRepository, required this.dio});

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
    // Check if the error is due to an expired access token (401 Unauthorized)
    if (err.response?.statusCode == 401) {
      try {
        // Attempt to refresh the token
        final refreshToken = await authenticationRepository.getRefreshToken;
        if (refreshToken != null) {
          final tokenResponse = await authenticationRepository.refreshToken(refreshToken: refreshToken);
          // Retry the failed request with the new access token
          final clonedRequest = await _retryRequest(err.requestOptions, tokenResponse.accessToken);
          return handler.resolve(clonedRequest);
        }
      } catch (e) {
        // Handle refresh token failure (e.g., logging out the user)
        handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: "failed-to-refresh-token",
        ));
      }
    }
    // For all other errors, pass the error to the next handler
    handler.next(err);
  }

  Future<Response> _retryRequest(RequestOptions requestOptions, String accessToken) async {
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    headers['Authorization'] = 'Bearer $accessToken';

    return dio.request(
      requestOptions.path,
      options: Options(
        method: requestOptions.method,
        headers: headers,
      ),
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
