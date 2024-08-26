import 'dart:convert';
import 'package:pine/pine.dart';
import '../../models/user/user.dart';

class UserStringMapper extends Mapper<User, String> {
  const UserStringMapper();

  static const _idField = '_id';
  static const _usernameField = 'username';
  static const _emailField = 'email';
  static const _avatarField = 'avatar';
  static const _createdAtField = 'createdAt';

  @override
  String from(User from) => jsonEncode(<String, dynamic>{
    _idField: from.id,
    _usernameField: from.username,
    _emailField: from.email,
    _avatarField: from.avatar,
    _createdAtField: from.createdAt.toIso8601String()
  });

  @override
  User to(String to) {
    final json = jsonDecode(to);

    return User(
        id: json[_idField],
        username: json[_usernameField],
        email: json[_emailField],
        avatar: json[_avatarField],
        createdAt: DateTime.parse(json[_createdAtField]));
  }
}
