import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    on<PerformSignInEvent>(_onPerform);
    on<GoogleSignInEvent>(_onGoogleSignIn);
    on<AppleSignInEvent>(_onAppleSignIn);
  }

  /// Method used to add the [PerformSignInEvent] event
  void perform({
    required String email,
    required String password,
  }) =>
      add(SignInEvent.perform(
        email: email,
        password: password,
      ));

  void google() => add(const SignInEvent.google());

  void apple() => add(const SignInEvent.apple());

  FutureOr<void> _onPerform(
    PerformSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.signingIn());
    try {
      final user = await authenticationRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(SignInState.signedIn(user));
    } on DioException catch (error) {
      emit(SignInState.errorSignIn(AuthError.fromMessage(error.response?.data)));
    } catch (e) {
      emit(SignInState.errorSignIn(GeneralSignInError()));
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
    } catch (_) {
      emit(SignInState.errorSignIn(GeneralSignInError()));
    }
  }

  FutureOr<void> _onAppleSignIn(
    AppleSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.signingIn());
    try {
      final user = await oAuthRepository.signInWithGoogle();
      emit(SignInState.signedInWithApple(user));
    } catch (_) {
      emit(SignInState.errorSignIn(GeneralSignInError()));
    }
  }
}
