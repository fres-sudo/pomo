part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {
  final User user;

  const AuthenticatedState(this.user);

  @override
  List<Object> get props => [user];
}

class NotAuthenticatedState extends AuthState {
  const NotAuthenticatedState();
}

class CheckAuthenticationState extends AuthState {
  const CheckAuthenticationState();
}
