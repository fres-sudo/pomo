part of 'project_bloc.dart';

@freezed
class ProjectEvent with _$ProjectEvent {
  
  const factory ProjectEvent.fetch({required String id}) = FetchProjectEvent;
  
  const factory ProjectEvent.createProject({required Project project}) = CreateProjectProjectEvent;

  const factory ProjectEvent.uploadProjectImageCover({required String id, required File imageCover}) = UploadImageCoverProjectEvent;

  const factory ProjectEvent.deleteProjectImageCover({required String id}) = DeleteImageCoverProjectEvent;

  const factory ProjectEvent.getProjectById({required String id}) = GetProjectByIdProjectEvent;
  
  const factory ProjectEvent.updateProjectById({required String id, required Project project}) = UpdateProjectByIdProjectEvent;

  const factory ProjectEvent.updateProjectsTasks({required String projectId, required List<Task> tasks}) = UpdateProjectsTasksProjectEvent;

  const factory ProjectEvent.deleteProjectById({required String id}) = DeleteProjectByIdProjectEvent;
  
}
