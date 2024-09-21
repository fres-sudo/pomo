part of 'recover_password_bloc.dart';

@freezed
class RecoverPasswordState with _$RecoverPasswordState {

  const factory RecoverPasswordState.none() = NoneRecoverPasswordState;
  
  const factory RecoverPasswordState.forgottingPassword() = ForgottingPasswordRecoverPasswordState;
  
  const factory RecoverPasswordState.forgottedPassword() = ForgottedPasswordRecoverPasswordState;
  
  const factory RecoverPasswordState.errorForgottingPassword(LocalizedError error) = ErrorForgottingPasswordRecoverPasswordState;
  
  const factory RecoverPasswordState.verifyingToken() = VerifyingTokenRecoverPasswordState;
  
  const factory RecoverPasswordState.verifiedToken() = VerifiedTokenRecoverPasswordState;
  
  const factory RecoverPasswordState.errorVerifyingToken(LocalizedError error) = ErrorVerifyingTokenRecoverPasswordState;
  
  const factory RecoverPasswordState.resettingPassword() = ResettingPasswordRecoverPasswordState;
  
  const factory RecoverPasswordState.resettedPassword() = ResettedPasswordRecoverPasswordState;
  
  const factory RecoverPasswordState.errorResettingPassword(LocalizedError error) = ErrorResettingPasswordRecoverPasswordState;
  
}
