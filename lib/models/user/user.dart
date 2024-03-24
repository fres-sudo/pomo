import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    String? name,
    String? surname,
    required String username,
    required String email,
    String? photo,
    String? token,
}) = _User;
}