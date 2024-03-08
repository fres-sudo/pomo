import 'package:pine/utils/dto_mapper.dart';

import '../constants/constants.dart';
import '../models/project/project.dart';
import '../models/task/task.dart';
import '../models/user/user.dart';
import '../services/network/jto/project/project_jto.dart';
import '../services/network/jto/task/task_jto.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/network/project/project_service.dart';
import 'mappers/project_mapper.dart';
import 'mappers/task_mapper.dart';
import 'mappers/user_mapper.dart';

/// Abstract class of ProjectRepository
abstract class ProjectRepository {
  Future<List<Project>> getProjectsByUser({
    required String userId,
  });

  Future<Project> createProject({
    required Project project,
  });

  Future<Project> getProjectsById({
    required String id,
  });

  Future<Project> updateProjectById({
    required String id,
    required Project project,
  });

  Future<void> deleteProjectById({
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
    try {
      final project = await projectService.addTaskToProject(
          projectId, taskMapper.toDTO(task));

      return projectMapper.fromDTO(project);
    } catch (error) {
      logger.e('Error adding task to project in: $error');
      throw Exception('Adding failed');
    }
  }

  @override
  Future<Project> createProject({required Project project}) async {
    try {
      final newProject =
      await projectService.createProject(projectMapper.toDTO(project));

      return projectMapper.fromDTO(newProject);
    } catch (error, stack) {
      logger.e('Error creating new project in: $error. The stack is: \n $stack ');
      throw Exception('Creation failed');
    }
  }

  @override
  Future<void> deleteProjectById({required String id}) async {
    try {
      await projectService.deleteProjectById(id);
    } catch (error) {
      logger.e('Error deleting project in: $error');
      throw Exception('Deleting failed');
    }
  }

  @override
  Future<void> deleteTaskFromProject(
      {required String projectId, required String taskId}) async {
    try {
      await projectService.deleteTaskFromProject(projectId, taskId);
    } catch (error) {
      logger.e('Error deleting task from project in: $error');
      throw Exception('Deleting task failed');
    }
  }

  @override
  Future<Project> getProjectsById({required String id}) async {
    try {
      final project = await projectService.getProjectById(id);

      return projectMapper.fromDTO(project);
    } catch (error) {
      logger.e('Error fetching project in: $error');
      throw Exception('Getter failed');
    }
  }

  @override
  Future<List<Project>> getProjectsByUser({required String userId}) async {
    try {
      final projects = await projectService.getProjectsByUser(userId);

      return projects.map((p) => projectMapper.fromDTO(p)).toList();
    } catch (error) {
      logger.e('Error fetching projects in: $error');
      throw Exception('Getter failed');
    }
  }

  @override
  Future<Project> updateProjectById(
      {required String id, required Project project}) async {
    try {
      final updatedProject = await projectService.updateProjectById(
          id, projectMapper.toDTO(project));

      return projectMapper.fromDTO(updatedProject);
    } catch (error) {
      logger.e('Error updating project in: $error');
      throw Exception('Update failed');
    }
  }

  @override
  Future<Project> updateTaskInProject(
      {required String projectId, required String taskId, required Task task}) async {
    try {
      final updatedProject = await projectService.updateTaskInProject(
          projectId, taskId,  taskMapper.toDTO(task));

      return projectMapper.fromDTO(updatedProject);
    } catch (error) {
      logger.e('Error updating task in project in: $error');
      throw Exception('Update failed');
    }
  }
}
