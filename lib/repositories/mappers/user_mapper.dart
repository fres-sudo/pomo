import 'package:pine/pine.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';

class UserMapper extends DTOMapper<UserJTO, User> {
  const UserMapper();

  @override
  User fromDTO(UserJTO dto) => User(
      id: dto.id,
      username: dto.username,
      email: dto.email,
      createdAt: dto.createdAt,
      avatar: dto.avatar);

  @override
  UserJTO toDTO(User model) => UserJTO(
      id: model.id,
      username: model.username,
      email: model.email,
      createdAt: model.createdAt,
      avatar: model.avatar);
}
