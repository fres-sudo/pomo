part of 'project_bloc.dart';

@freezed
class ProjectState with _$ProjectState {

  const factory ProjectState({
    @Default([]) List<Project> projects,
    @Default(false) bool isLoading,
    LocalizedError? error,
    ProjectOperation? operation
  }) = _ProjectState;

  const ProjectState._();
}


enum ProjectOperation { read, create, update, delete }


