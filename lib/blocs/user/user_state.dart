part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {

  const factory UserState.updating() = UpdatingUserState;
  
  const factory UserState.updated(User user) = UpdatedUserState;

  const factory UserState.errorUpdating() = ErrorUpdatingUserState;

}
