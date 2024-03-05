import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pomo/services/network/task/task_service.dart';

/// Test case for the class TaskService
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late TaskService service;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    service = TaskService(dio);
  });

  //TODO: Test your methods
}