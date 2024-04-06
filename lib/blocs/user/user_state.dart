part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {

  const factory UserState.updating() = UpdatingUserState;
  
  const factory UserState.updated(User user) = UpdatedUserState;

  const factory UserState.errorUpdating() = ErrorUpdatingUserState;

  const factory UserState.updatingPhoto() = UpdatingPhotoUserState;

  const factory UserState.updatedPhoto(User user) = UpdatedPhotoUserState;

  const factory UserState.errorUpdatingPhoto() = ErrorUpdatingPhotoUserState;

  const factory UserState.fetchingOTP() = FetchingOTPUserState;

  const factory UserState.fetchedOTP(ForgotPassResponse response) = FetchedOTPUserState;

  const factory UserState.errorFetchingOTP() = ErrorFetchingOTPUserState;

}
