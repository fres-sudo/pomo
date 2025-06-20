part of 'user_bloc.dart';

enum UserOperation { updated, deleted, updatedImage, read, deletedPhoto }

@freezed
sealed class UserState with _$UserState {
  const factory UserState({
    User? user,
    @Default(false) bool isLoading,
    LocalizedError? error,
    UserOperation? operation,
    String? searchedUsername,
  }) = _UserState;

  const UserState._();

  /*
  const factory UserState.updating() = UpdatingUserState;

  const factory UserState.updated(User user) = UpdatedUserState;

  const factory UserState.errorUpdating() = ErrorUpdatingUserState;

  const factory UserState.deleting() = DeletingUserState;

  const factory UserState.deleted() = DeletedUserState;

  const factory UserState.errorDeleting() = ErrorDeletingUserState;

  const factory UserState.updatingPhoto() = UpdatingPhotoUserState;

  const factory UserState.updatedPhoto(User user) = UpdatedPhotoUserState;

  const factory UserState.errorUpdatingPhoto() = ErrorUpdatingPhotoUserState;

  const factory UserState.fetchingOTP() = FetchingOTPUserState;

  const factory UserState.fetchedOTP(ForgotPassResponse response) = FetchedOTPUserState;

  const factory UserState.errorFetchingOTP() = ErrorFetchingOTPUserState;

  const factory UserState.recovering() = RecoveringUserState;

  const factory UserState.recovered() = RecoveredUserState;

  const factory UserState.errorRecovering() = ErrorRecoveringUserState;

  const factory UserState.none() = NoneUserState;
*/
}
