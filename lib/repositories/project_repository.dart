import 'dart:io';

import 'package:pine/utils/dto_mapper.dart';

import '../constants/constants.dart';
import '../models/project/project.dart';
import '../models/task/task.dart';
import '../models/user/user.dart';
import '../services/network/jto/project/project_jto.dart';
import '../services/network/jto/task/task_jto.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/network/project/project_service.dart';

/// Abstract class of ProjectRepository
abstract class ProjectRepository {
  Future<List<Project>> getProjectsByUser({
    required String userId,
  });

  Future<Project> createProject({
    required Project project,
  });
  Future<Project> uploadProjectImageCover({
    required String id,
    required File imageCover,
  });

  Future<Project> deleteProjectImageCover({
    required String id,
  });

  Future<Project> getProjectsById({
    required String id,
  });

  Future<Project> updateProjectById({
    required String id,
    required Project project,
  });

  Future<Project> deleteProjectById({
    required String id,
  });

  Future<Project> addTaskToProject({
    required String projectId,
    required Task task,
  });

  Future<Project> updateTaskInProject({
    required String projectId,
    required String taskId,
    required Task task,
  });

  Future<void> deleteTaskFromProject(
      {required String projectId, required String taskId});
}

/// Implementation of the base interface ProjectRepository
class ProjectRepositoryImpl implements ProjectRepository {
  const ProjectRepositoryImpl({
    required this.projectService,
    required this.userMapper,
    required this.taskMapper,
    required this.projectMapper,
  });

  final ProjectService projectService;
  final DTOMapper<UserJTO, User>  userMapper;
  final DTOMapper<TaskJTO, Task> taskMapper;
  final DTOMapper<ProjectJTO, Project>  projectMapper;

  @override
  Future<Project> addTaskToProject(
      {required String projectId, required Task task}) async {
      final project = await projectService.addTaskToProject(
          projectId, taskMapper.toDTO(task));
      return projectMapper.fromDTO(project);
  }

  @override
  Future<Project> createProject({required Project project}) async {
      final newProject =
      await projectService.createProject(projectMapper.toDTO(project));
      return projectMapper.fromDTO(newProject);
  }

  @override
  Future<Project> uploadProjectImageCover({required String id, required File imageCover}) async {
      final newProject =
      await projectService.uploadProjectImageCover(id, imageCover);
      return projectMapper.fromDTO(newProject);
  }

  @override
  Future<Project> deleteProjectImageCover({required String id}) async {
      final project =
      await projectService.deleteProjectImageCover(id);
      return projectMapper.fromDTO(project);
  }

  @override
  Future<Project> deleteProjectById({required String id}) async {
      final project = await projectService.deleteProjectById(id);
      return projectMapper.fromDTO(project);
  }

  @override
  Future<void> deleteTaskFromProject(
      {required String projectId, required String taskId}) async {
      await projectService.deleteTaskFromProject(projectId, taskId);
  }

  @override
  Future<Project> getProjectsById({required String id}) async {
      final project = await projectService.getProjectsByUser(id);
      return projectMapper.fromDTO(project.first);
  }

  @override
  Future<List<Project>> getProjectsByUser({required String userId}) async {
      final projects = await projectService.getProjectsByUser(userId);
      return projects.map((p) => projectMapper.fromDTO(p)).toList();
  }

  @override
  Future<Project> updateProjectById(
      {required String id, required Project project}) async {
      final updatedProject = await projectService.updateProjectById(
          id, projectMapper.toDTO(project));
      return projectMapper.fromDTO(updatedProject);
  }

  @override
  Future<Project> updateTaskInProject(
      {required String projectId, required String taskId, required Task task}) async {
      final updatedProject = await projectService.updateTaskInProject(
          projectId, taskId,  taskMapper.toDTO(task));
      return projectMapper.fromDTO(updatedProject);
  }
}
