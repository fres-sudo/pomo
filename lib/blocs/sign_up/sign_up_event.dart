part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  
  const factory SignUpEvent.perform() = PerformSignUpEvent;
  
}
