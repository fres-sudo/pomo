
import 'package:intl/intl.dart';
import 'package:pine/utils/dto_mapper.dart';

import '../constants/constants.dart';
import '../constants/enum.dart';
import '../models/project/project.dart';
import '../models/task/task.dart';
import '../services/network/jto/project/project_jto.dart';
import '../services/network/jto/task/task_jto.dart';
import '../services/network/task/task_service.dart';

/// Abstract class of TaskRepository
abstract class TaskRepository {
  Future<Task> createTask({
    required Task task
  });
  Future<Task> getTaskById({
    required String id
  });
  Future<Task> updateTaskById({
    required String id,
    required Task task,
  });
  Future<Task> deleteTaskById({
    required String id,
  });
  Future<List<Task>> getTasksByProject({
    required String projectId,
  });
  Future<List<Task>> getTasksByUser({
    required String userId,
  });
  Future<List<Task>> fetchTasks({
    required String userId,
    required DateTime date,
    required FetchType type
  });
}

/// Implementation of the base interface TaskRepository
class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl({
    required this.taskService,
    required this.projectMapper,
    required this.taskMapper,
});

  final TaskService taskService;
  final DTOMapper<TaskJTO, Task> taskMapper;
  final DTOMapper<ProjectJTO, Project> projectMapper;

  @override
  Future<Task> createTask({required Task task}) async {
    try {
      final newTask =
          await taskService.createTask(taskMapper.toDTO(task));
      return taskMapper.fromDTO(newTask);
    } catch (error, stack) {
      logger.e('Error creating new task in: $error, this is the stack: \n $stack');
      throw Exception('Creation failed');
    }
  }

  @override
  Future<Task> deleteTaskById({required String id}) async {
    try {
      final task = await taskService.deleteTaskById(id);
      return taskMapper.fromDTO(task);

    } catch (error) {
      logger.e('Error deleting task in: $error');
      throw Exception('Deleting task failed');
    }
  }

  @override
  Future<Task> getTaskById({required String id}) async {
    try {
      final task = await taskService.getTaskById(id);

      return taskMapper.fromDTO(task);
    } catch (error) {
      logger.e('Error fetching task by id in: $error');
      throw Exception('Getter failed');
    }
  }

  @override
  Future<List<Task>> getTasksByProject({required String projectId}) async {
    try {
      final tasks = await taskService.getTasksByProject(projectId);

      return tasks.map((t) => taskMapper.fromDTO(t)).toList();
    } catch (error, stack) {
      logger.e('Error fetching tasks by project in: $error \n This is the stack: $stack');
      throw Exception('Getter failed');
    }
  }

  @override
  Future<List<Task>> getTasksByUser({required String userId}) async {
    try {
      final tasks = await taskService.getTasksByUser(userId);

      return tasks.map((t) => taskMapper.fromDTO(t)).toList();
    } catch (error, stack) {
      logger.e('Error fetching tasks by user in: $error \n This is the stack: $stack');
      throw Exception('Getter failed');
    }
  }

  @override
  Future<Task> updateTaskById({required String id, required Task task}) async {
    try {
      final updatedTask = await taskService.updateTaskById(id, taskMapper.toDTO(task));

      return taskMapper.fromDTO(updatedTask);
    } catch (error) {
      logger.e('Error updating taskin: $error');
      throw Exception('Update failed');
    }
  }

  @override
  Future<List<Task>> fetchTasks({required String userId, required DateTime date, required FetchType type}) async {
    try {
      final dateString = DateFormat("yyyy-MM-dd").format(date);
      final tasks = await taskService.getTasksByDay(userId, dateString, type.type);
      return tasks.map((task) => taskMapper.fromDTO(task)).toList(growable: false);
    } catch (error) {
      logger.e('Error fetching tasks by day: $error');
      throw Exception('Update failed');
    }
  }
}


