import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/repositories/authentication_repository.dart';
import 'dart:async';

import '../../models/user/user.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

/// The SignInBloc
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository authenticationRepository;

  /// Create a new instance of [SignInBloc].
  SignInBloc({
    required this.authenticationRepository,
  }) : super(const SignInState.notSignedIn()) {
    on<PerformSignInEvent>(_onPerform);
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
    } catch (_) {
      emit(const SignInState.errorSignIn());
    }
  }
}
