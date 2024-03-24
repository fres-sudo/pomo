part of 'project_bloc.dart';

@freezed
class ProjectState with _$ProjectState {
  
  const factory ProjectState.fetching() = FetchingProjectState;
  
  const factory ProjectState.fetched(List<Project> projects) = FetchedProjectState;
  
  const factory ProjectState.errorFetching() = ErrorFetchingProjectState;

  const factory ProjectState.none() = NoneProjectState;

  const factory ProjectState.getting() = GettingProjectState;

  const factory ProjectState.got(Project projects) = GotProjectState;

  const factory ProjectState.errorGetting() = ErrorGettingProjectState;
  
  const factory ProjectState.creating() = CreatingProjectState;
  
  const factory ProjectState.created(Project project) = CreatedProjectState;
  
  const factory ProjectState.errorCreating() = ErrorCreatingProjectState;
  
  const factory ProjectState.updating() = UpdatingProjectState;
  
  const factory ProjectState.updated(Project project) = UpdatedProjectState;
  
  const factory ProjectState.errorUpdating() = ErrorUpdatedProjectState;
  
  const factory ProjectState.deleting() = DeletingProjectState;
  
  const factory ProjectState.deleted(Project project) = DeletedProjectState;
  
  const factory ProjectState.errorDeleting() = ErrorDeletingProjectState;
  
}
