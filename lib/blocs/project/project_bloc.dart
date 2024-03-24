import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
}) : super(const ProjectState.fetching()) {
    on<GetProjectsByUserProjectEvent>(_onGetProjectsByUser);
    on<CreateProjectProjectEvent>(_onCreateProject);
    on<GetProjectByIdProjectEvent>(_onGetProjectById);
    on<UpdateProjectByIdProjectEvent>(_onUpdateProjectById);
    on<DeleteProjectByIdProjectEvent>(_onDeleteProjectById);
  }
  
  /// Method used to add the [GetProjectsByUserProjectEvent] event
  void getProjectsByUser({required String id}) => add(ProjectEvent.getProjectsByUser(id: id));
  
  /// Method used to add the [CreateProjectProjectEvent] event
  void createProject({required Project project}) => add(ProjectEvent.createProject(project: project));
  
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
    emit(const ProjectState.fetching());
    try{
      final projects = await projectRepository.getProjectsByUser(userId: event.id);
      if(projects.isEmpty) {
        emit(const ProjectState.none());
      } else {
        emit(ProjectState.fetched(projects));
      }
    }catch(_){
      emit(const ProjectState.errorFetching());
    }
  }
  
  FutureOr<void> _onCreateProject(
    CreateProjectProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.creating());
    try{
      final project = await projectRepository.createProject(project: event.project);
      emit(ProjectState.created(project));
    }catch(_){
      emit(const ProjectState.errorCreating());
    }
  }
  
  FutureOr<void> _onGetProjectById(
    GetProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.getting());
    try{
      final project = await projectRepository.getProjectsById(id: event.id);
      emit(ProjectState.got(project));
    }catch(_){
      emit(const ProjectState.errorGetting());
    }
  }
  
  FutureOr<void> _onUpdateProjectById(
    UpdateProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.updating());
    try{
      final project = await projectRepository.updateProjectById(id: event.id, project: event.project);
      emit(ProjectState.updated(project));
    }catch(_){
      emit(const ProjectState.errorUpdating());
    }
  }
  
  FutureOr<void> _onDeleteProjectById(
    DeleteProjectByIdProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.deleting());
    try{
      final project = await projectRepository.deleteProjectById(id: event.id);
      emit(ProjectState.deleted(project));
    }catch(_){
      emit(const ProjectState.errorDeleting());
  }
  }
  
}
