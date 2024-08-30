import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/error/localized.dart';
import 'package:pomo/error/projects_error.dart';
import 'dart:async';

import '../../models/project/project.dart';
import '../../repositories/project_repository.dart';

part 'project_event.dart';

part 'project_state.dart';

part 'project_bloc.freezed.dart';

/// The ProjectBloc
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {

  final ProjectRepository projectRepository;
  /// Create a new instance of [ProjectBloc].
  ProjectBloc({
    required this.projectRepository,
}) : super(const ProjectState()) {
    on<GetProjectsByUserProjectEvent>(_onGetProjectsByUser);
    on<CreateProjectProjectEvent>(_onCreateProject);
    on<UploadImageCoverProjectEvent>(_onUploadProjectImageCover);
    on<UpdateProjectByIdProjectEvent>(_onUpdateProjectById);
    on<DeleteProjectByIdProjectEvent>(_onDeleteProjectById);
  }
  
  /// Method used to add the [GetProjectsByUserProjectEvent] event
  void getProjectsByUser({required String userId}) => add(ProjectEvent.getProjectsByUser(id: userId));
  
  /// Method used to add the [CreateProjectProjectEvent] event
  void createProject({required Project project}) => add(ProjectEvent.createProject(project: project));

  /// Method used to add the [UploadImageCoverProjectEvent] event
  void uploadProjectImageCover({required String id, required File imageCover}) => add(ProjectEvent.uploadProjectImageCover(id: id, imageCover: imageCover));

  /// Method used to add the [GetProjectByIdProjectEvent] event
  void getProjectById({required String id}) => add(ProjectEvent.getProjectById(id: id));
  
  /// Method used to add the [UpdateProjectByIdProjectEvent] event
  void updateProjectById({required String id, required Project project}) => add(ProjectEvent.updateProjectById(id: id, project: project));
  
  /// Method used to add the [DeleteProjectByIdProjectEvent] event
  void deleteProjectById({required String id}) => add(ProjectEvent.deleteProjectById(id: id));
  
  
  FutureOr<void> _onGetProjectsByUser(
    GetProjectsByUserProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final projects = await projectRepository.getProjectsByUser(userId: event.id);
      emit(state.copyWith(isLoading: false, projects: projects, operation: ProjectOperation.read));
    }catch(_){
      emit(state.copyWith(error: FetchingProjectsError()));
    }
  }
  
  FutureOr<void> _onCreateProject(
    CreateProjectProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final project = await projectRepository.createProject(project: event.project);
      final updatedProjects = List<Project>.from(state.projects)..add(project);
      emit(state.copyWith(isLoading: false, projects: updatedProjects, operation: ProjectOperation.create),);
    }catch(_){
      emit(state.copyWith(error: CreatingProjectsError()));
    }
  }

  FutureOr<void> _onUploadProjectImageCover(
      UploadImageCoverProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final project = await projectRepository.uploadProjectImageCover(id: event.id, imageCover: event.imageCover);
    }catch(_){
    }
  }
  

  FutureOr<void> _onUpdateProjectById(
    UpdateProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final project = await projectRepository.updateProjectById(id: event.id, project: event.project);
      final projects = List<Project>.from(state.projects);
      projects.removeWhere((element) => element.id == project.id);
      projects.add(project);
      emit(state.copyWith(isLoading: false, projects: projects,operation: ProjectOperation.update));
    }catch(_){
      emit(state.copyWith(error: UpdatingProjectsError()));
    }
  }
  
  FutureOr<void> _onDeleteProjectById(
    DeleteProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final project = await projectRepository.deleteProjectById(id: event.id);
      final projects = List<Project>.from(state.projects);
      projects.removeWhere((element) => element.id == project.id);
      emit(state.copyWith(isLoading: false, projects:projects, operation: ProjectOperation.delete));
    }catch(_){
      emit(state.copyWith(error: DeletingProjectsError()));
  }
  }
  
}
