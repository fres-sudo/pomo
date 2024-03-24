import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/repositories/authentication_repository.dart';
import 'dart:async';

import '../../models/user/user.dart';
import '../../repositories/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

/// The UserBloc
class UserBloc extends Bloc<UserEvent, UserState> {

  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;

  /// Create a new instance of [UserBloc].
  UserBloc({required this.userRepository, required this.authenticationRepository}) : super(const UserState.none()) {
    on<UpdateUserUserEvent>(_onUpdateUser);
    on<SignOutUserEvent>(_onSignOut);
    on<CheckAuthenticationUserEvent>(_onCheckAuthentication);
    on<AuthenticatedUserEvent>(_onAuthenticated);
  }
  
  /// Method used to add the [UpdateUserUserEvent] event
  void updateUser({required User user, required String id, FormData? photo}) => add(UserEvent.updateUser(user: user, id: id, photo: photo));
  void signOut() => add(const UserEvent.signOut());
  void checkAuthentication() => add(const UserEvent.checkAuthentication());
  void authenticated({required User user}) => add(UserEvent.authenticated(user: user));

  
  FutureOr<void> _onUpdateUser(
    UpdateUserUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.updating());
    try{
      final user = await userRepository.updateUser(user: event.user, id: event.id, photo: event.photo);
      emit(UserState.updated(user));
    }catch(_){
      emit(const UserState.errorUpdating());
    }
  }

  FutureOr<void> _onSignOut(
    SignOutUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.signingOut());
    try {
      await authenticationRepository.signOut();
      emit(const UserState.signedOut());
    } catch (_) {
      emit(const UserState.errorSigningOut());
    }
  }

  void _onAuthenticated(
      AuthenticatedUserEvent event,
      Emitter<UserState> emit,
      ) {
    //print("USER IN BLOC: ${event.user}");
  emit(UserState.authenticated(event.user));
}


  FutureOr<void> _onCheckAuthentication(
    CheckAuthenticationUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.checkingAuthentication());
    try{
      final user = await authenticationRepository.currentUser;
      //print("USER IN BLOC: ${user}");
      emit(user != null
          ? UserState.authenticated(user)
          : const UserState.notAuthenticated());
    }catch(_){
      emit(const UserState.errorCheckingAuthentication());
    }
  }


  
}
