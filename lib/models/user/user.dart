import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const User._() : super();

  const factory User({
    required String id,
    required String username,
    required String email,
    required DateTime createdAt,
    String? avatar,
  }) = _User;

  static User fake() {
    return User(id: "", username: "username", email: "email@email.com", createdAt: DateTime.now());
  }
}
