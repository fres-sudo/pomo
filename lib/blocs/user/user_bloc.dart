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
  UserBloc({required this.userRepository, required this.authenticationRepository}) : super(const UserState.updating()) {
    on<UpdateUserUserEvent>(_onUpdateUser);

  }
  
  /// Method used to add the [UpdateUserUserEvent] event
  void updateUser({required User user, required String id, FormData? photo}) => add(UserEvent.updateUser(user: user, id: id, photo: photo));

  
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



  
}
