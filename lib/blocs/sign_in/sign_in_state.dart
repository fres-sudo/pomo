part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  
  const factory SignInState.notSignedIn() = NotSignedInSignInState;
  
  const factory SignInState.signingIn() = SigningInSignInState;
  
  const factory SignInState.signedIn(User user) = SignedInSignInState;

  const factory SignInState.signedInWithGoogle(User user) = SignedInWithGoogleSignInState;
  const factory SignInState.signedInWithApple(User user) = SignedInWithAppleSignInState;

  const factory SignInState.errorSignIn(LocalizedError error) = ErrorSignInSignInState;
  
}
