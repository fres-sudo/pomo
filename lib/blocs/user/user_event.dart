part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  
  const factory UserEvent.updateUser({required String id, required User user}) = UpdateUserUserEvent;

  const factory UserEvent.updateUserPhoto({required String id,required File photo}) = UpdateUserPhotoUserEvent;

  const factory UserEvent.forgotPassword({required String email}) = ForgotPasswordUserEvent;

  const factory UserEvent.recoverPassword({required String token, required String password, required String passwordConfirm}) = RecoverPasswordUserEvent;

}
