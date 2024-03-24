import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pomo/services/network/user/user_service.dart';

/// Test case for the class UserService
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late UserService service;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    service = UserService(dio);
  });

  //TODO: Test your methods
}