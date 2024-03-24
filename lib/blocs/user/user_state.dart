part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {

  const factory UserState.none() = NoneUserState;

  const factory UserState.updating() = UpdatingUserState;
  
  const factory UserState.updated(User user) = UpdatedUserState;
  
  const factory UserState.errorUpdating() = ErrorUpdatingUserState;

  const factory UserState.authenticated(User user) = AuthenticatedUserState;

  const factory UserState.notAuthenticated() = NotAuthenticatedUserState;

  const factory UserState.checkingAuthentication() = CheckAuthenticationUserState;

  const factory UserState.errorCheckingAuthentication() = ErrorCheckingAuthenticationUserState;

  const factory UserState.signingOut() = SigninOutUserState;

  const factory UserState.signedOut() = SignedOutUserState;

  const factory UserState.errorSigningOut() = ErrorSigningOutUserState;
  
}
