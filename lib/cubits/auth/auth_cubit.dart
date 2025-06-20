import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import '../../models/user/user.dart';
import '../../repositories/authentication_repository.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

/// The AuthCubit
class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;
  late final StreamSubscription<bool> _authStatusSubscription;

  AuthCubit({required this.authenticationRepository}) : super(const AuthState.notAuthenticated()) {
    _authStatusSubscription = authenticationRepository.authStatusStream.listen((isAuthenticated) {
      if (!isAuthenticated) {
        emit(const AuthState.notAuthenticated());
      }
    });
  }

  /// Method used to perform the [checkAuthentication] action
  FutureOr<void> checkAuthentication() async {
    final user = await authenticationRepository.currentUser;

    emit(user != null ? AuthState.authenticated(user) : const AuthState.notAuthenticated());
  }

  /// Method used to perform the [authenticated] action
  void authenticated(User user) => emit(AuthState.authenticated(user));

  /// Method used to perform the [signOut] action
  FutureOr<void> signOut() async {
    await authenticationRepository.signOut();
  }

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }
}
