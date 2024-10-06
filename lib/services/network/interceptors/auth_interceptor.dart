
import 'package:dio/dio.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/repositories/authentication_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AuthenticationRepository authenticationRepository;
  final Dio dio;

  AuthInterceptor({required this.authenticationRepository, required this.dio,});

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
        final refreshToken = await authenticationRepository.getRefreshToken;
        final tokenResponse = await authenticationRepository.refreshToken(refreshToken: refreshToken ?? "");
        final clonedRequest = await _retryRequest(err.requestOptions, tokenResponse.accessToken);
        return handler.resolve(clonedRequest);
      } catch (_) {
        authenticationRepository.signOut();
      }
    }
    return super.onError(err, handler);
  }

  Future<Response> _retryRequest(RequestOptions requestOptions, String accessToken) async {
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    headers['Authorization'] = 'Bearer $accessToken';

    return dio.request(
      '${requestOptions.baseUrl}${requestOptions.path}',
      options: Options(
        method: requestOptions.method,
        headers: headers,
      ),
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
