import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';

/// Test case for the class AuthenticationService
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late AuthenticationService service;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    service = AuthenticationService(dio);
  });

  //TODO: Test your methods
}