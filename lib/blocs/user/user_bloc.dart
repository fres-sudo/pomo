import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/repositories/authentication_repository.dart';
import 'package:pomo/services/network/response/forgot_pass/forgot_pass_response.dart';
import 'dart:async';

import '../../models/user/user.dart';
import '../../repositories/user_repository.dart';
import '../../services/network/jto/user/user_jto.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

/// The UserBloc
class UserBloc extends Bloc<UserEvent, UserState> {

  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;

  String _otp = "";
  String _resetToken = "";

  String get resetToken => _resetToken;
  String get otp => _otp;

  /// Create a new instance of [UserBloc].
  UserBloc({required this.userRepository, required this.authenticationRepository}) : super(const UserState.updating()) {
    on<UpdateUserUserEvent>(_onUpdateUser);
    on<UpdateUserPhotoUserEvent>(_onUpdateUserPhoto);
    on<ForgotPasswordUserEvent>(_onForgotPassword);
  }
  
  /// Method used to add the [UpdateUserUserEvent] event
  void updateUser({required String id, required User user}) => add(UserEvent.updateUser(user: user, id: id));
  void updateUserPhoto({required String id, required File photo}) => add(UserEvent.updateUserPhoto(id: id, photo: photo));
  void forgotPassword({required String email}) => add(UserEvent.forgotPassword(email: email));
  
  FutureOr<void> _onUpdateUser(
    UpdateUserUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.updating());
    try{
      final user = await userRepository.updateUser(user: event.user, id: event.id,);
      emit(UserState.updated(user));
    }catch(_){
      emit(const UserState.errorUpdating());
    }
  }

  FutureOr<void> _onUpdateUserPhoto(
    UpdateUserPhotoUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.updatingPhoto());
    try{
      final user = await userRepository.updateUserPhoto(id: event.id, photo: event.photo);
      emit(UserState.updatedPhoto(user));
    }catch(_){
      emit(const UserState.errorUpdatingPhoto());
    }
  }

  FutureOr<void> _onForgotPassword(
    ForgotPasswordUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.fetchingOTP());
    try{
      final response = await userRepository.forgotPassword(email : event.email);
      _otp = response.otp;
      _resetToken = response.token;
      emit(UserState.fetchedOTP(response));
    }catch(_){
      emit(const UserState.errorUpdatingPhoto());
    }
  }



  
}
