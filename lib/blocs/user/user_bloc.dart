import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/error/users_error.dart';
import 'package:pomo/repositories/authentication_repository.dart';
import 'package:pomo/services/network/response/forgot_pass/forgot_pass_response.dart';
import 'dart:async';

import '../../error/localized.dart';
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
  UserBloc({required this.userRepository, required this.authenticationRepository}) : super(const UserState()) {
    on<UpdateUserUserEvent>(_onUpdateUser);
    on<UpdateUserPhotoUserEvent>(_onUpdateUserPhoto);
    on<DeleteUserUserEvent>(_onDeleteUser);
    on<SearchUsernameUserEvent>(_onSearchByUsername);

  }
  
  /// Method used to add the [UpdateUserUserEvent] event
  void updateUser({required String id, required User user}) => add(UserEvent.updateUser(user: user, id: id));
  void deleteUser({required String id}) => add(UserEvent.deleteUser(id: id));
  void searchUsername({required String username}) => add(UserEvent.searchUsername(username:username));
  void updateUserPhoto({required String id, required File photo}) => add(UserEvent.updateUserPhoto(id: id, photo: photo));

  FutureOr<void> _onUpdateUser(
    UpdateUserUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final user = await userRepository.updateUser(user: event.user, id: event.id,);
      emit(state.copyWith(user: user, isLoading: false, error: null, operation: UserOperation.updated));
    }catch(_){
      emit(state.copyWith(isLoading: false, error: UpdatingUserError()));
    }
  }

  FutureOr<void> _onDeleteUser(
    DeleteUserUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      await userRepository.deleteUser(id: event.id,);
      emit(state.copyWith( isLoading: false, error: null, operation: UserOperation.deleted));
    }catch(_){
      emit(state.copyWith(isLoading: false, error: DeletingUserError()));
    }
  }

  FutureOr<void> _onUpdateUserPhoto(
    UpdateUserPhotoUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final user = await userRepository.updateUserPhoto(id: event.id, photo: event.photo);
      emit(state.copyWith(user: user, isLoading: false, error: null, operation: UserOperation.updatedImage));
    }catch(_){
      emit(state.copyWith(isLoading: false, error: UpdatingUserImageError()));
    }
  }

  FutureOr<void> _onSearchByUsername(
    SearchUsernameUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try{
      final username = await userRepository.searchUsername(username: event.username);
      emit(state.copyWith( isLoading: false, error: null, operation: UserOperation.read, searchedUsername: username));
    }catch(_){
      emit(state.copyWith(isLoading: false, error: SearchingUsernameError()));
    }
  }
/*
  FutureOr<void> _onForgotPassword(
    ForgotPasswordUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.fetchingOTP());
    try{
      final response = await userRepository.forgotPassword(email : event.email);
      _otp = response.resetOTP;
      _resetToken = response.resetToken;
      emit(UserState.fetchedOTP(response));
    }catch(_){
      emit(const UserState.errorFetchingOTP());
    }
  }

  FutureOr<void> _onRecoverPassword(
    RecoverPasswordUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.recovering());
    try{
      await userRepository.recoverPassword(token : event.token, password: event.password, passwordConfirm: event.passwordConfirm);
      emit(const UserState.recovered());
    }catch(_){
      emit(const UserState.errorRecovering());
    }
  }
  */
}
