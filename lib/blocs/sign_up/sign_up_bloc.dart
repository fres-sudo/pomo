import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import '../../models/user/user.dart';
import '../../repositories/authentication_repository.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';

/// The SignUpBloc
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationRepository authenticationRepository;

  /// Create a new instance of [SignUpBloc].
  SignUpBloc({
    required this.authenticationRepository,
  }) : super(const SignUpState.notSignedUp()) {
    on<PerformSignUpEvent>(_onPerform);
  }

  /// Method used to add the [PerformSignUpEvent] event
  void perform({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) =>
      add(SignUpEvent.perform(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ));


  FutureOr<void> _onPerform(PerformSignUpEvent event,
      Emitter<SignUpState> emit,) async {
    emit(const SignUpState.signingUp());
    try {
      final user = await authenticationRepository.signUp(
          username: event.username,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword);

      emit(SignUpState.signedUp(user));
    } catch (_) {
      emit(const SignUpState.errorSignUp());
    }
  }

}
