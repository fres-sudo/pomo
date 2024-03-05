part of 'project_bloc.dart';

@freezed
class ProjectEvent with _$ProjectEvent {
  
  const factory ProjectEvent.getProjectsByUser({required String id}) = GetProjectsByUserProjectEvent;
  
  const factory ProjectEvent.createProject({required Project project}) = CreateProjectProjectEvent;
  
  const factory ProjectEvent.getProjectById({required String id}) = GetProjectByIdProjectEvent;
  
  const factory ProjectEvent.updateProjectById({required String id, required Project project}) = UpdateProjectByIdProjectEvent;
  
  const factory ProjectEvent.deleteProjectById({required String id}) = DeleteProjectByIdProjectEvent;
  
}
