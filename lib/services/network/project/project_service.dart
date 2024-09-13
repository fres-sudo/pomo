import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pomo/services/network/jto/project/project_jto.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';
import 'package:retrofit/retrofit.dart';

part 'project_service.g.dart';

/// Abstract class of ProjectService
@RestApi()
abstract class ProjectService {
  factory ProjectService(Dio dio, {String baseUrl}) = _ProjectService;

  @GET('/projects/{userId}')
  Future<List<ProjectJTO>> getProjectsByUser(@Path('userId') String id);

  @POST('/projects')
  Future<ProjectJTO> createProject(@Body() ProjectJTO body);
  @PUT('/projects/image/{projectId}')
  @MultiPart()
  Future<ProjectJTO> uploadProjectImageCover(@Path('projectId') String id, @Part() File image,);

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