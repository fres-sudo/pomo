import 'package:intl/intl.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/constants.dart';
import '../models/project/project.dart';
import '../models/task/task.dart';
import '../services/network/jto/project/project_jto.dart';
import '../services/network/jto/task/task_jto.dart';
import '../services/network/task/task_service.dart';

/// Abstract class of TaskRepository
abstract class TaskRepository {
  Future<Task> createTask({required Task task});

  Future<Task> getTaskById({required String id});

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
    required CalendarFormat format
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
      final newTask = await taskService.createTask(taskMapper.toDTO(task));
      return taskMapper.fromDTO(newTask);
  }

  @override
  Future<Task> deleteTaskById({required String id}) async {
      final task = await taskService.deleteTaskById(id);
      return taskMapper.fromDTO(task);
  }

  @override
  Future<Task> getTaskById({required String id}) async {
      final task = await taskService.getTaskById(id);
      return taskMapper.fromDTO(task);
  }

  @override
  Future<List<Task>> getTasksByProject({required String projectId}) async {
      final tasks = await taskService.getTasksByProject(projectId);
      return tasks.map((t) => taskMapper.fromDTO(t)).toList();
  }

  @override
  Future<List<Task>> getTasksByUser({required String userId}) async {
      final tasks = await taskService.getTasksByUser(userId);
      return tasks.map((t) => taskMapper.fromDTO(t)).toList();
  }

  @override
  Future<Task> updateTaskById({required String id, required Task task}) async {
      final updatedTask = await taskService.updateTaskById(id, taskMapper.toDTO(task));
      return taskMapper.fromDTO(updatedTask);
  }

  @override
  Future<List<Task>> fetchTasks({required String userId, required DateTime date, required CalendarFormat format}) async {
      final dateString = DateFormat("yyyy-MM-dd").format(date);
      final tasks = await taskService.getScheduledTask(userId, dateString, format);
      return tasks.map((task) => taskMapper.fromDTO(task)).toList(growable: false);
  }
}
