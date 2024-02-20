import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';

/// The SignUpBloc
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  /// Create a new instance of [SignUpBloc].
  SignUpBloc() : super(const SignUpState.performing()) {
    on<PerformSignUpEvent>(_onPerform);
    
  }
  
  /// Method used to add the [PerformSignUpEvent] event
  void perform() => add(const SignUpEvent.perform());
  
  
  FutureOr<void> _onPerform(
    PerformSignUpEvent event,
    Emitter<SignUpState> emit,
  ) {
    //TODO: map PerformSignUpEvent to SignUpState states
  }
  
}
