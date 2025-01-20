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
  TaskBloc({required this.taskRepository}) : super(const TaskState.initial()) {
    on<FetchTasksEvent>(_onFetchTasks);
    on<CreateTaskTaskEvent>(_onCreateTask);
    on<UpdateTaskByIdTaskEvent>(_onUpdateTaskById);
    on<DeleteTaskByIdTaskEvent>(_onDeleteTaskById);
    on<GetTasksByProjectTaskEvent>(_onGetTasksByProject);
    on<GetByIdTaskEvent>(_onGetTaskById);
  }

  /// Method used to add the [CreateTaskTaskEvent] event
  void create({required Task task}) => add(TaskEvent.createTask(task: task));

  /// Method used to add the [UpdateTaskByIdTaskEvent] event
  void update({required String id, required Task task}) => add(TaskEvent.updateTaskById(id: id, task: task));

  /// Method used to add the [DeleteTaskByIdTaskEvent] event
  void delete({required String id}) => add(TaskEvent.deleteTaskById(id: id));

  /// Method used to add the [GetTasksByProjectTaskEvent] event
  void getByProject({required String projectId}) => add(TaskEvent.getTasksByProject(projectId: projectId));

  /// Method used to add the [GetTasksByDayTaskEvent] event
  void fetch({required String userId, required DateTime date, required CalendarFormat format}) =>
      add(TaskEvent.fetchTasks(userId: userId, date: date, format: format));

  void getOneById({required String id}) => add(TaskEvent.getTaskById(id: id));

  FutureOr<void> _onFetchTasks(
    FetchTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskState.fetching());
    try {
      final tasks = await taskRepository.fetchTasks(userId: event.userId, date: event.date, format: event.format);
      emit(TaskState.fetched(tasks));
    } catch (error, stack) {
      logger.e("_onFetchTasks", error: error, stackTrace: stack);
      emit(TaskState.errorFetching(FetchingTasksError()));
    }
  }

  FutureOr<void> _onCreateTask(
    CreateTaskTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskState.creating());
    try {
      final newTask = await taskRepository.createTask(task: event.task);
      emit(TaskState.created(newTask));
    } catch (error, stack) {
      logger.e("_onCreateTask", error: error, stackTrace: stack);
      emit(TaskState.errorCreating(CreatingTasksError()));
    }
  }

  FutureOr<void> _onUpdateTaskById(
    UpdateTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskState.updating());
    try {
      final updatedTask = await taskRepository.updateTaskById(task: event.task, id: event.id);
      emit(TaskState.updated(updatedTask));
    } catch (error, stack) {
      logger.e("_onUpdateTaskById", error: error, stackTrace: stack);
      emit(TaskState.errorUpdating(UpdatingTasksError()));
    }
  }

  FutureOr<void> _onDeleteTaskById(
    DeleteTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskState.deleting());
    try {
      await taskRepository.deleteTaskById(id: event.id);
      emit(TaskState.deleted());
    } catch (error, stack) {
      logger.e("_onDeleteTaskById", error: error, stackTrace: stack);
      emit(TaskState.errorDeleting(DeletingTasksError()));
    }
  }

  FutureOr<void> _onGetTasksByProject(
    GetTasksByProjectTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskState.fetchingByProject());
    try {
      final tasks = await taskRepository.getTasksByProject(projectId: event.projectId);
      emit(TaskState.fetchedByProject(tasks));
    } catch (error, stack) {
      logger.e("_onGetTasksByProject", error: error, stackTrace: stack);
      emit(TaskState.errorFetchingByProject(FetchingTasksError()));
    }
  }

  FutureOr<void> _onGetTaskById(GetByIdTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskState.getting());
    try {
      final task = await taskRepository.getTaskById(id: event.id);
      emit(TaskState.got(task));
    } catch (error, stack) {
      logger.e("_onGetTask", error: error, stackTrace: stack);
      emit(TaskState.errorGetting(FetchingTasksError()));
    }
  }
}
