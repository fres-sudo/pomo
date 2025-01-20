part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  
  const factory UserEvent.updateUser({required String id, required User user}) = UpdateUserUserEvent;

  const factory UserEvent.updateUserPhoto({required String id,required File photo}) = UpdateUserPhotoUserEvent;

  const factory UserEvent.deleteUser({required String id}) = DeleteUserUserEvent;

  const factory UserEvent.deleteUserPhoto({required String userId,}) = DeleteUserPhotoUserEvent;

  const factory UserEvent.searchUsername({required String username}) = SearchUsernameUserEvent;
}
