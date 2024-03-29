part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  
  const factory UserEvent.updateUser({required String id, required User user, FormData? photo}) = UpdateUserUserEvent;

}
