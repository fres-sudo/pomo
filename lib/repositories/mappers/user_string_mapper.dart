import 'dart:convert';
import 'package:pine/pine.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';
import '../../models/user/user.dart';

class UserStringMapper extends Mapper<User, String> {
  const UserStringMapper();

  static const _idField = '_id';
  static const _usernnameField = 'name';
  static const _emailField = 'email';
  static const _tokenField = 'token';

  @override
  String from(User from) => jsonEncode(<String, dynamic>{
    _idField: from.id,
    _usernnameField: from.username,
    _emailField: from.email,
    _tokenField: from.token,
  });

  @override
  User to(String to) {
    final json = jsonDecode(to);

    return User(
      id: json[_idField],
      username: json[_usernnameField],
      email: json[_emailField],
      token: json[_tokenField],
    );
  }
  
  
}
