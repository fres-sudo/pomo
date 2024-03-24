import 'dart:convert';
import 'package:pine/pine.dart';
import '../../models/user/user.dart';

class UserStringMapper extends Mapper<User, String> {
  const UserStringMapper();

  static const _idField = '_id';
  static const _usernameField = 'username';
  static const _emailField = 'email';
  static const _nameField = 'name';
  static const _surnameField = 'surname';
  static const _photoField = 'photo';
  static const _tokenField = 'token';

  @override
  String from(User from) => jsonEncode(<String, dynamic>{
    _idField: from.id,
    _usernameField: from.username,
    _emailField: from.email,
    _nameField: from.name,
    _surnameField: from.surname,
    _tokenField: from.token,
    _photoField : from.photo,
  });

  @override
  User to(String to) {
    final json = jsonDecode(to);

    return User(
      id: json[_idField],
      username: json[_usernameField],
      email: json[_emailField],
      name: json [_nameField],
      surname: json[_surnameField],
      token: json[_tokenField],
      photo: json[_photoField]
    );
  }
  
  
}
