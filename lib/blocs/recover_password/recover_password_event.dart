part of 'recover_password_bloc.dart';

@freezed
class RecoverPasswordEvent with _$RecoverPasswordEvent {
  
  const factory RecoverPasswordEvent.forgotPassword({required String email}) = ForgotPasswordRecoverPasswordEvent;
  
  const factory RecoverPasswordEvent.verifyToken({required String email, required String token}) = VerifyTokenRecoverPasswordEvent;
  
  const factory RecoverPasswordEvent.resetPassword({required String email, required String token, required String newPassword, required String confirmNewPassword}) = ResetPasswordRecoverPasswordEvent;
  
}
