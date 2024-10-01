import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/constants/constants.dart';

class CookieInterceptor extends Interceptor {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _cookieKey = 'session_cookie';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final cookie = await _storage.read(key: _cookieKey);
    logger.i(cookie);
    if (cookie != null) {
      options.headers["Cookie"] = cookie;
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    await _updateCookie(response);
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      await _updateCookie(err.response!);
    }
    return handler.next(err);
  }

  Future<void> _updateCookie(Response response) async {
    final cookies = response.headers['Set-Cookie'];
    logger.i(cookies);
    if (cookies != null) {
      final cookie = cookies.join('; ');
      if (cookie.isNotEmpty) {
        await _storage.write(key: _cookieKey, value: cookie);
      }
    }
  }

  Future<void> clearCookies() async {
    await _storage.delete(key: _cookieKey);
  }
}
