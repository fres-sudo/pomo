import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../jto/task/task_jto.dart';

part 'task_service.g.dart';

/// Abstract class of TaskService
@RestApi()
abstract class TaskService {
  factory TaskService(Dio dio, {String baseUrl}) = _TaskService;

  @POST('/tasks')
  Future<TaskJTO> createTask(@Body() TaskJTO body);

  @GET('/tasks/{id}')
  Future<TaskJTO> getTaskById(@Path('id') String id);
  @PATCH('/tasks/{taskId}')
  Future<TaskJTO> updateTaskById(@Path('taskId') String id ,@Body() TaskJTO task);
  @DELETE('/tasks/{taskId}')
  Future<TaskJTO> deleteTaskById(@Path('taskId') String id);

  @GET('/tasks/user')
  Future<List<TaskJTO>> getTasksByDay(@Query('userId') String userId, @Query('date') String date, @Query('type') String type);

  @GET('/tasks/project/{projectId}')
  Future<List<TaskJTO>> getTasksByProject(@Path('projectId') String id);

  @GET('/tasks/user/{userId}')
  Future<List<TaskJTO>> getTasksByUser(@Path('userId') String id);

}