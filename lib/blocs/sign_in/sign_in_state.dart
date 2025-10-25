part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.notSignedIn() = NotSignedInSignInState;

  const factory SignInState.signingIn() = SigningInSignInState;

  const factory SignInState.signedIn(String email) = SignedInSignInState;

  const factory SignInState.verifyingEmail() = VerifyingEmailSignInState;

  const factory SignInState.verificationSuccessful() =
      VerificationSuccessfulSignInState;

  const factory SignInState.verificationError(LocalizedError error) =
      VerificationFailedSignInState;

  const factory SignInState.signedInWithGoogle(User user) =
      SignedInWithGoogleSignInState;
  const factory SignInState.signedInWithApple(User user) =
      SignedInWithAppleSignInState;

  const factory SignInState.errorSignIn(LocalizedError error) =
      ErrorSignInSignInState;
}
