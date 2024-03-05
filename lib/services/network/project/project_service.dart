import 'package:dio/dio.dart';
import 'package:pomo/services/network/jto/project/project_jto.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'project_service.g.dart';

/// Abstract class of ProjectService
@RestApi()
abstract class ProjectService {
  factory ProjectService(Dio dio, {String baseUrl}) = _ProjectService;

  @GET('/api/v1/projects/user/{id}')
  Future<List<ProjectJTO>> getProjectsByUser(@Path('id') String id);

  @POST('/api/v1/projects/')
  Future<ProjectJTO> createProject(@Body() ProjectJTO body);

  @GET('/api/v1/projects/{id}')
  Future<ProjectJTO> getProjectById(@Path('id') String id);
  @PATCH('/api/v1/projects/{id}')
  Future<ProjectJTO> updateProjectById(@Path('id') String id, @Body() ProjectJTO body);
  @DELETE('/api/v1/projects/{id}')
  Future<void> deleteProjectById(@Path('id') String id);

  @GET('/api/v1/projects/{projectId}/tasks/')
  Future<ProjectJTO> addTaskToProject(@Path('projectId') String projectId, @Body() TaskJTO task);
  @PATCH('/api/v1/projects/{projectId}/tasks/{taskId}')
  Future<ProjectJTO> updateTaskInProject(@Path('projectId') String projectId, @Path('taskId') String taskId, @Body() TaskJTO body);
  @DELETE('/api/v1/projects/{id}')
  Future<void> deleteTaskFromProject(@Path('projectId') String projectId, @Path('taskId') String taskId);
}