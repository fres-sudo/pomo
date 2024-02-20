part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  
  const factory SignInState.performing() = PerformingSignInState;
  
  const factory SignInState.performed() = PerformedSignInState;
  
  const factory SignInState.error() = ErrorSignInState;
  
}
