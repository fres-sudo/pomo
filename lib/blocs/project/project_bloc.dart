import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/error/localized.dart';
import 'package:pomo/error/projects_error.dart';
import 'package:pomo/models/task/task.dart';

import '../../models/project/project.dart';
import '../../repositories/project_repository.dart';

part 'project_bloc.freezed.dart';

part 'project_event.dart';

part 'project_state.dart';

/// The ProjectBloc
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepository projectRepository;

  /// Create a new instance of [ProjectBloc].
  ProjectBloc({
    required this.projectRepository,
  }) : super(ProjectState.initial()) {
    on<FetchProjectEvent>(_onFetchProjects);
    on<CreateProjectProjectEvent>(_onCreateProject);
    on<UploadImageCoverProjectEvent>(_onUploadProjectImageCover);
    on<DeleteImageCoverProjectEvent>(_onDeleteProjectImageCover);
    on<UpdateProjectByIdProjectEvent>(_onUpdateProjectById);
    on<DeleteProjectByIdProjectEvent>(_onDeleteProjectById);
  }

  /// Method used to add the [GetProjectsByUserProjectEvent] event
  void fetch({required String userId}) => add(ProjectEvent.fetch(id: userId));

  /// Method used to add the [CreateProjectProjectEvent] event
  void createProject({required Project project}) => add(ProjectEvent.createProject(project: project));

  /// Method used to add the [UploadImageCoverProjectEvent] event
  void uploadProjectImageCover({required String id, required File imageCover}) =>
      add(ProjectEvent.uploadProjectImageCover(id: id, imageCover: imageCover));

  /// Method used to add the [GetProjectByIdProjectEvent] event
  void getProjectById({required String id}) => add(ProjectEvent.getProjectById(id: id));

  /// Method used to add the [UpdateProjectByIdProjectEvent] event
  void updateProjectById({required String id, required Project project}) => add(ProjectEvent.updateProjectById(id: id, project: project));

  void updateProjectsTasks({required String projectId, required List<Task> tasks}) =>
      add(ProjectEvent.updateProjectsTasks(projectId: projectId, tasks: tasks));

  /// Method used to add the [DeleteProjectByIdProjectEvent] event
  void deleteProjectById({required String id}) => add(ProjectEvent.deleteProjectById(id: id));

  void deleteProjectImageCover({required String id}) => add(ProjectEvent.deleteProjectImageCover(id: id));

  FutureOr<void> _onFetchProjects(
    FetchProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectState.fetching());
    try {
      final projects = await projectRepository.getProjectsByUser(userId: event.id);
      emit(ProjectState.fetched(projects));
    } catch (_) {
      emit(ProjectState.errorFetching(FetchingProjectsError()));
    }
  }

  FutureOr<void> _onCreateProject(
    CreateProjectProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectState.creating());
    try {
      final project = await projectRepository.createProject(project: event.project);
      emit(ProjectState.created(project));
    } catch (_) {
      emit(ProjectState.errorCreating(CreatingProjectsError()));
    }
  }

  FutureOr<void> _onUploadProjectImageCover(
    UploadImageCoverProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectState.uploadingImageCover());
    try {
      final project = await projectRepository.uploadProjectImageCover(id: event.id, imageCover: event.imageCover);
      emit(ProjectState.updated(project));
    } catch (_) {
      emit(ProjectState.errorUploadingImageCover(UpdatingProjectsError()));
    }
  }

  FutureOr<void> _onDeleteProjectImageCover(
    DeleteImageCoverProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectState.deletingImageCover());
    try {
      await projectRepository.deleteProjectImageCover(id: event.id);
      emit(ProjectState.deletedImageCover());
    } catch (_) {
      emit(ProjectState.errorDeletingImageCover(UpdatingProjectsError()));
    }
  }

  FutureOr<void> _onUpdateProjectById(
    UpdateProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectState.updating());
    try {
      final project = await projectRepository.updateProjectById(id: event.id, project: event.project);
      emit(ProjectState.updated(project));
    } catch (_) {
      emit(ProjectState.errorUpdating(UpdatingProjectsError()));
    }
  }

  FutureOr<void> _onDeleteProjectById(
    DeleteProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectState.deleting());
    try {
      await projectRepository.deleteProjectById(id: event.id);
      emit(ProjectState.deleted());
    } catch (_) {
      emit(ProjectState.errorDeleting(DeletingProjectsError()));
    }
  }
}
