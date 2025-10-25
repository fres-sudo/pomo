part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.email({
    required String email,
  }) = EmailSignInEvent;

  const factory SignInEvent.verifyOtp({
    required String email,
    required String otp,
  }) = VerifyOtpSignInEvent;

  const factory SignInEvent.google() = GoogleSignInEvent;
  const factory SignInEvent.apple() = AppleSignInEvent;
}
