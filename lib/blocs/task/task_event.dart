part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  
  const factory TaskEvent.createTask({required Task task}) = CreateTaskTaskEvent;
  
  const factory TaskEvent.getTaskById({required String id}) = GetTaskByIdTaskEvent;
  
  const factory TaskEvent.updateTaskById({required String id, required Task task}) = UpdateTaskByIdTaskEvent;
  
  const factory TaskEvent.deleteTaskById({required String id}) = DeleteTaskByIdTaskEvent;
  
  const factory TaskEvent.getTasksByProject({required String projectId}) = GetTasksByProjectTaskEvent;

  const factory TaskEvent.getTasksByUser({required String userId}) = GetTasksByUserTaskEvent;

}
