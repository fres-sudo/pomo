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

  @GET('/projects/user/{id}')
  Future<List<ProjectJTO>> getProjectsByUser(@Path('id') String id);

  @POST('/projects/')
  Future<ProjectJTO> createProject(@Body() ProjectJTO body);

  @GET('/projects/{id}')
  Future<ProjectJTO> getProjectById(@Path('id') String id);
  @PATCH('/projects/{id}')
  Future<ProjectJTO> updateProjectById(@Path('id') String id, @Body() ProjectJTO body);
  @DELETE('/projects/{id}')
  Future<ProjectJTO> deleteProjectById(@Path('id') String id);

  //
  @POST('/projects/{projectId}/tasks/')
  Future<ProjectJTO> addTaskToProject(@Path('projectId') String projectId, @Body() TaskJTO task);
  @PATCH('/projects/{projectId}/tasks/{taskId}')
  Future<ProjectJTO> updateTaskInProject(@Path('projectId') String projectId, @Path('taskId') String taskId, @Body() TaskJTO body);
  @DELETE('/projects/{id}')
  Future<void> deleteTaskFromProject(@Path('projectId') String projectId, @Path('taskId') String taskId);
}//