import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/constants.dart';
import '../../error/localized.dart';
import '../../error/tasks_error.dart';
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
    on<FetchTasksEvent>(_onFetchTasks);
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

  /// Method used to add the [GetTasksByDayTaskEvent] event
  void fetch({required String userId, required DateTime date, required CalendarFormat format}) => add(TaskEvent.fetchTasks(userId: userId, date: date, format: format));

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
    }  catch (error, stack) {
      logger.e("_onCreateTask", error: error, stackTrace: stack);
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
    }  catch (error, stack) {
      logger.e("_onUpdateTaskById", error: error, stackTrace: stack);
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
    } catch (error, stack) {
      logger.e("_onDeleteTaskById", error: error, stackTrace: stack);
      emit(state.copyWith(isLoading: false, error: DeletingTasksError()));
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
    } catch (error, stack) {
      logger.e("_onGetTasksByProject", error: error, stackTrace: stack);
      emit(state.copyWith(isLoading: false, error: FetchingTasksError()));
    }
  }

  FutureOr<void> _onFetchTasks(
    FetchTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final tasks = await taskRepository.fetchTasks(userId: event.userId, date: event.date, format: event.format);
      emit(state.copyWith(isLoading: false, error: null, operation: TaskOperation.readByDay, tasks:tasks));
    } catch (error, stack) {
      logger.e("_onFetchTasks", error: error, stackTrace: stack);
      emit(state.copyWith(isLoading: false, error: FetchingTasksError()));
    }
  }

}
