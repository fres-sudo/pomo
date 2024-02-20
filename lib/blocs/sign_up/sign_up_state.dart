part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  
  const factory SignUpState.performing() = PerformingSignUpState;
  
  const factory SignUpState.performed() = PerformedSignUpState;
  
  const factory SignUpState.error() = ErrorSignUpState;
  
}
