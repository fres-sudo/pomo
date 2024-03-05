import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../jto/task/task_jto.dart';

part 'task_service.g.dart';

/// Abstract class of TaskService
@RestApi()
abstract class TaskService {
  factory TaskService(Dio dio, {String baseUrl}) = _TaskService;

  @POST('/api/v1/tasks/')
  Future<TaskJTO> createTask(@Body() TaskJTO body);

  @GET('/api/v1/tasks/{id}')
  Future<TaskJTO> getTaskById(@Path('id') String id);
  @PATCH('/api/v1/tasks/{id}')
  Future<TaskJTO> updateTaskById(@Path('id') String id, TaskJTO task);
  @DELETE('/api/v1/tasks/{id}')
  Future<void> deleteTaskById(@Path('id') String id);

  @GET('/api/v1/tasks/project/{projectId}')
  Future<List<TaskJTO>> getTasksByProject(@Path('projectId') String id);




}