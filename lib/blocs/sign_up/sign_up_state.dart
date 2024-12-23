part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  
  const factory SignUpState.notSignedUp() = NotSignedUpSignUpState;
  
  const factory SignUpState.signingUp() = SigningUpSignUpState;
  
  const factory SignUpState.signedUp(User user) = SignedUpSignUpState;
  
  const factory SignUpState.errorSignUp(LocalizedError error) = ErrorSignUpSignUpState;
  
}
