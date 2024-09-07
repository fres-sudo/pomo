import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/constants/constants.dart';
import 'package:pomo/error/tasks_error.dart';

import '../../error/localized.dart';
import '../../models/task/task.dart';
import '../../repositories/task_repository.dart';

part 'task_bloc.freezed.dart';

part 'task_event.dart';

part 'task_state.dart';

/// The TaskBloc
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  /// Create a new instance of [TaskBloc].
  TaskBloc({required this.taskRepository}) : super(const TaskState()) {
    on<CreateTaskTaskEvent>(_onCreateTask);
    on<UpdateTaskByIdTaskEvent>(_onUpdateTaskById);
    on<DeleteTaskByIdTaskEvent>(_onDeleteTaskById);
    on<SetTasksTaskEvent>(_onSetTasks);
    on<GetTasksByProjectTaskEvent>(_onGetTasksByProject);
  }

  /// Method used to add the [SetTasksTaskEvent] event
  void setTasks({required List<Task> tasks}) => add(TaskEvent.setTasks(tasks: tasks));

  /// Method used to add the [CreateTaskTaskEvent] event
  void create({required Task task}) => add(TaskEvent.createTask(task: task));

  /// Method used to add the [UpdateTaskByIdTaskEvent] event
  void update({required String id, required Task task}) => add(TaskEvent.updateTaskById(id: id, task: task));

  /// Method used to add the [DeleteTaskByIdTaskEvent] event
  void delete({required String id}) => add(TaskEvent.deleteTaskById(id: id));

  /// Method used to add the [GetTasksByProjectTaskEvent] event
  void getByProject({required String projectId}) => add(TaskEvent.getTasksByProject(projectId: projectId));

  FutureOr<void> _onSetTasks(
      SetTasksTaskEvent event,
      Emitter<TaskState> emit,
      ) async {
    emit(state.copyWith(tasks: event.tasks));
  }

  FutureOr<void> _onCreateTask(
    CreateTaskTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final newTask = await taskRepository.createTask(task: event.task);
      final tasks = List<Task>.from(state.tasks);
      tasks.add(newTask);
      emit(state.copyWith(isLoading: false, error: null, operation: TaskOperation.create, tasks: tasks));
    } catch (_) {
      emit(state.copyWith(isLoading: false, error: CreatingTasksError()));
    }
  }

  FutureOr<void> _onUpdateTaskById(
    UpdateTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final updatedTask= await taskRepository.updateTaskById(task: event.task, id: event.id);
      final tasks = List<Task>.from(state.tasks);
      tasks.removeWhere((t) => t.id == event.id);
      tasks.add(updatedTask);
      emit(state.copyWith(isLoading: false, error: null, operation: TaskOperation.update, tasks: tasks));
      logger.i(state.tasks);
    } catch (_) {
      emit(state.copyWith(isLoading: false, error: UpdatingTasksError()));
    }
  }

  FutureOr<void> _onDeleteTaskById(
    DeleteTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await taskRepository.deleteTaskById(id: event.id);
      final tasks = List<Task>.from(state.tasks);
      tasks.removeWhere((t) => t.id == event.id);
      emit(state.copyWith(isLoading: false, error: null, operation: TaskOperation.delete, tasks: tasks));
    } catch (_) {
      emit(state.copyWith(isLoading: false, error: UpdatingTasksError()));
    }
  }

  FutureOr<void> _onGetTasksByProject(
    GetTasksByProjectTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final tasks = await taskRepository.getTasksByProject(projectId: event.projectId);
      emit(state.copyWith(isLoading: false, error: null, operation: TaskOperation.read, tasks:tasks));
    } catch (_) {
      emit(state.copyWith(isLoading: false, error: FetchingTasksByProjectError()));
    }
  }

}
