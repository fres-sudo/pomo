import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import '../../models/task/task.dart';
import '../../repositories/task_repository.dart';

part 'task_event.dart';

part 'task_state.dart';

part 'task_bloc.freezed.dart';

/// The TaskBloc
class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final TaskRepository taskRepository;

  /// Create a new instance of [TaskBloc].
  TaskBloc({required this.taskRepository}) : super(const TaskState.creating()) {
    on<CreateTaskTaskEvent>(_onCreateTask);
    on<GetTaskByIdTaskEvent>(_onGetTaskById);
    on<UpdateTaskByIdTaskEvent>(_onUpdateTaskById);
    on<DeleteTaskByIdTaskEvent>(_onDeleteTaskById);
    on<GetTasksByProjectTaskEvent>(_onGetTasksByProject);
    on<GetTasksByUserTaskEvent>(_onGetTasksByUser);

  }
  
  /// Method used to add the [CreateTaskTaskEvent] event
  void createTask({required Task task}) => add(TaskEvent.createTask(task: task));
  
  /// Method used to add the [GetTaskByIdTaskEvent] event
  void getTaskById({required String id}) => add(TaskEvent.getTaskById(id: id));
  
  /// Method used to add the [UpdateTaskByIdTaskEvent] event
  void updateTaskById({required String id, required Task task}) => add(TaskEvent.updateTaskById(id: id, task: task));
  
  /// Method used to add the [DeleteTaskByIdTaskEvent] event
  void deleteTaskById({required String id}) => add(TaskEvent.deleteTaskById(id: id));
  
  /// Method used to add the [GetTasksByProjectTaskEvent] event
  void getTasksByProject({required String projectId}) => add(TaskEvent.getTasksByProject(projectId: projectId));

  /// Method used to add the [GetTasksByUserTaskEvent] event
  void getTasksByUser({required String userId}) => add(TaskEvent.getTasksByUser(userId: userId));


  FutureOr<void> _onCreateTask(
      CreateTaskTaskEvent event,
      Emitter<TaskState> emit,
      ) async {
    emit(const TaskState.creating());
    try{
      final newTask = await taskRepository.createTask(task: event.task);
      emit(TaskState.created(newTask));
    } catch(e) {
      emit(const TaskState.errorCreating());
    }
  }

  
  FutureOr<void> _onGetTaskById(
    GetTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.getting());
    try{
      final task = await taskRepository.getTaskById(id: event.id);
      emit(TaskState.got(task));
    }catch(_){
      emit(const TaskState.errorGetting());
    }
  }
  
  FutureOr<void> _onUpdateTaskById(
    UpdateTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.updating());
    try{
      final updatedTask = await taskRepository.updateTaskById(id: event.id, task: event.task);
      emit(TaskState.updated(updatedTask));
    }catch(_){
      emit(const TaskState.errorUpdating());
    }
  }
  
  FutureOr<void> _onDeleteTaskById(
    DeleteTaskByIdTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.deleting());
    try{
      await taskRepository.deleteTaskById(id: event.id);
      emit(const TaskState.deleted());
    }catch(_){
      emit(const TaskState.errorDeleting());
    }
  }
  
  FutureOr<void> _onGetTasksByProject(
    GetTasksByProjectTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.fetching());
    try{
      final tasks = await taskRepository.getTasksByProject(projectId: event.projectId);
      tasks.isEmpty ? emit(const TaskState.none()) : emit(TaskState.fetched(tasks));
    }catch(_){
      emit(const TaskState.errorFetching());
    }
  }

  FutureOr<void> _onGetTasksByUser(
    GetTasksByUserTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.fetchingByUser());
    try{
      final tasks = await taskRepository.getTasksByUser(userId: event.userId);
      tasks.isEmpty ? emit(const TaskState.noneUsers()) : emit(TaskState.fetchedByUser(tasks));
    }catch(_){
      emit(const TaskState.errorFetchingByUser());
    }
  }
  
}
