part of 'project_bloc.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = InitialProjectState;

  const factory ProjectState.fetching() = FetchingProjectState;
  const factory ProjectState.fetched(List<Project> projects) = FetchedProjectState;
  const factory ProjectState.errorFetching(LocalizedError error) = ErrorFetchigProjectState;

  const factory ProjectState.creating() = CreatingProjectState;
  const factory ProjectState.created(Project project) = CreatedProjectState;
  const factory ProjectState.errorCreating(LocalizedError error) = ErrorCreatingProjectState;

  const factory ProjectState.uploadingImageCover() = UploadingImageCoverProjectState;
  const factory ProjectState.uploadedImageCover(String imageCover) = UploadedImageCoverProjectState;
  const factory ProjectState.errorUploadingImageCover(LocalizedError error) = ErrorUploadingImageCoverProjectState;

  const factory ProjectState.deletingImageCover() = DeletingImageCoverProjectState;
  const factory ProjectState.deletedImageCover() = DeletedImageCoverProjectState;
  const factory ProjectState.errorDeletingImageCover(LocalizedError error) = ErrorDeletingImageCoverProjectState;

  const factory ProjectState.updating() = UpdatingProjectState;
  const factory ProjectState.updated(Project project) = UpdatedProjectState;
  const factory ProjectState.errorUpdating(LocalizedError error) = ErrorUpdatingProjectState;

  const factory ProjectState.deleting() = DeletingProjectState;
  const factory ProjectState.deleted() = DeletedProjectState;
  const factory ProjectState.errorDeleting(LocalizedError error) = ErrorDeletingProjectState;
}
