part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  
  const factory TaskState.creating() = CretaingTaskState;
  
  const factory TaskState.created(Task task) = CreatedTaskState;
  
  const factory TaskState.errorCreating() = ErrorCreatingTaskState;
  
  const factory TaskState.updating() = UpdatingTaskState;
  
  const factory TaskState.updated(Task task) = UpdatedTaskState;
  
  const factory TaskState.errorUpdating() = ErrorUpdatingTaskState;
  
  const factory TaskState.deleting() = DeletingTaskState;
  
  const factory TaskState.deleted() = DeletedTaskState;
  
  const factory TaskState.errorDeleting() = ErrorDeletingTaskState;
  
  const factory TaskState.fetching() = FetchingTaskState;
  
  const factory TaskState.fetched(List<Task> tasks) = FetchedTaskState;
  
  const factory TaskState.errorFetching() = ErrorFetchingTaskState;
  
  const factory TaskState.getting() = GettingTaskState;
  
  const factory TaskState.got(Task task) = GotTaskState;
  
  const factory TaskState.errorGetting() = ErrorGettingTaskState;
  
}