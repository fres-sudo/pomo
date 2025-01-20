part of 'task_bloc.dart';

enum TaskOperation { read, create, update, delete, readByDay }


@freezed
class TaskState with _$TaskState {

  const factory TaskState.initial() = InitialTaskState;

  const factory TaskState.fetching() = FetchingTaskState;
  const factory TaskState.fetched(List<Task> tasks) = FetchedTaskState;
  const factory TaskState.errorFetching(LocalizedError error) = ErrorFetchingTaskState;

  const factory TaskState.creating() = CreatingTaskState;
  const factory TaskState.created(Task task) = CreatedTaskState;
  const factory TaskState.errorCreating(LocalizedError error) = ErrorCreatingTaskState;

  const factory TaskState.updating() = UpdatingTaskState;
  const factory TaskState.updated(Task task) = UpdatedTaskState;
  const factory TaskState.errorUpdating(LocalizedError error) = ErrorUpdatingTaskState;

  const factory TaskState.deleting() = DeletingTaskState;
  const factory TaskState.deleted() = DeletedTaskState;
  const factory TaskState.errorDeleting(LocalizedError error) = ErrorDeletingTaskState;

  const factory TaskState.fetchingByProject() = FetchingByProjectTaskState;
  const factory TaskState.fetchedByProject(List<Task> tasks) = FetchedByProjectTaskState;
  const factory TaskState.errorFetchingByProject(LocalizedError error) = ErrorFetchingByProjectTaskState;

  const factory TaskState.getting() = GettingTaskState;
  const factory TaskState.got(Task task) = GotTaskState;
  const factory TaskState.errorGetting(LocalizedError error) = ErrorGettingTaskState;
}
