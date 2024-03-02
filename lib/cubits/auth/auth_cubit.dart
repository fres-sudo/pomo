import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/repositories/authentication_repository.dart';

import '../../models/user/user.dart';
import 'package:equatable/equatable.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;

  AuthCubit({required this.authenticationRepository})
      : super(const CheckAuthenticationState());

  void checkAuthenticationState() async {
    final user = await authenticationRepository.currentUser;

    emit(user != null
        ? AuthenticatedState(user)
        : const NotAuthenticatedState());
  }

  void authenticated(User user) => emit(AuthenticatedState(user));

  void signOut() async {
    await authenticationRepository.signOut();

    emit(const NotAuthenticatedState());
  }
}
