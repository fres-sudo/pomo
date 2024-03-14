import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'package:pomo/repositories/authentication_repository.dart';

import '../../models/user/user.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

/// The AuthCubit
class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;


  /// Create a new instance of [AuthCubit].
  AuthCubit({
    required this.authenticationRepository
  }) : super(const AuthState.checkAuthentication());

  /// Method used to perform the [checkAuthentication] action
  FutureOr<void> checkAuthentication() async {
    final user = await authenticationRepository.currentUser;
    emit(user != null
        ? AuthState.authenticated(user)
        : const AuthState.notAuthenticated());
  }

  /// Method used to perform the [authenticated] action
  void authenticated(User user) => emit(AuthState.authenticated(user));

  /// Method used to perform the [signOut] action
  FutureOr<void>  signOut() async {
    await authenticationRepository.signOut();

    emit(const AuthState.notAuthenticated());
  }

}