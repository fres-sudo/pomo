import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/constants/constants.dart';
import 'package:pomo/error/auth_error.dart';
import 'package:pomo/error/localized.dart';
import 'package:pomo/repositories/authentication_repository.dart';

import '../../models/user/user.dart';
import '../../repositories/o_auth_repository.dart';

part 'sign_in_bloc.freezed.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

/// The SignInBloc
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository authenticationRepository;
  final OAuthRepository oAuthRepository;

  /// Create a new instance of [SignInBloc].
  SignInBloc({
    required this.authenticationRepository,
    required this.oAuthRepository,
  }) : super(const SignInState.notSignedIn()) {
    on<EmailSignInEvent>(_onEmailSignIn);
    on<VerifyOtpSignInEvent>(_onVerifyOtp);
    on<GoogleSignInEvent>(_onGoogleSignIn);
    on<AppleSignInEvent>(_onAppleSignIn);
  }

  /// Method used to add the [EmailSignInEvent] event
  void email({
    required String email,
  }) =>
      add(SignInEvent.email(
        email: email,
      ));

  void verifyOtp({
    required String email,
    required String otp,
  }) =>
      add(SignInEvent.verifyOtp(
        email: email,
        otp: otp,
      ));

  void google() => add(const SignInEvent.google());

  void apple() => add(const SignInEvent.apple());

  FutureOr<void> _onEmailSignIn(
    EmailSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.signingIn());
    try {
      await authenticationRepository.signIn(
        email: event.email,
      );
      emit(SignInState.signedIn(event.email));
    } on DioException catch (error, stack) {
      logger.e("_onEmailSignIn", error: error, stackTrace: stack);
      emit(
          SignInState.errorSignIn(AuthError.fromMessage(error.response?.data)));
    } catch (e, stack) {
      logger.e("_onPerform", error: e, stackTrace: stack);
      emit(SignInState.errorSignIn(GeneralSignInError()));
    }
  }

  FutureOr<void> _onVerifyOtp(
    VerifyOtpSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.verifyingEmail());
    try {
      await authenticationRepository.verifyOtp(
        email: event.email,
        otp: event.otp,
      );
      emit(const SignInState.verificationSuccessful());
    } on DioException catch (error, stack) {
      logger.e("_onVerifyOtp", error: error, stackTrace: stack);
      emit(SignInState.verificationError(
          AuthError.fromMessage(error.response?.data)));
    } catch (e, stack) {
      logger.e("_onVerifyOtp", error: e, stackTrace: stack);
      emit(SignInState.verificationError(GeneralSignInError()));
    }
  }

  FutureOr<void> _onGoogleSignIn(
    GoogleSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.signingIn());
    try {
      final user = await oAuthRepository.signInWithGoogle();
      emit(SignInState.signedInWithGoogle(user));
    } catch (e, stack) {
      logger.e("_onGoogleSignIn", error: e, stackTrace: stack);
      emit(SignInState.errorSignIn(GeneralSignInError()));
    }
  }

  FutureOr<void> _onAppleSignIn(
    AppleSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.signingIn());
    try {
      final user = await oAuthRepository.signInWithApple();
      emit(SignInState.signedInWithApple(user));
    } catch (e, stack) {
      logger.e("_onAppleSignIn", error: e.toString(), stackTrace: stack);
      emit(SignInState.errorSignIn(GeneralSignInError()));
    }
  }
}
