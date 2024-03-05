import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pomo/services/network/project/project_service.dart';

/// Test case for the class ProjectService
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late ProjectService service;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    service = ProjectService(dio);
  });

  //TODO: Test your methods
}