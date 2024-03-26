import 'package:dio/dio.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:pomo/services/network/user/user_service.dart';

import '../constants/constants.dart';
import '../models/user/user.dart';
import '../services/network/jto/user/user_jto.dart';

/// Abstract class of UserRepository
abstract class UserRepository {
  Future<User> updateUser({
      required String id,
      required User user,
      FormData? photo,
 });
}

/// Implementation of the base interface UserRepository
class UserRepositoryImpl implements UserRepository {
    const UserRepositoryImpl({
      required this.userService,
      required this.userMapper,
});

    final UserService userService;
    final DTOMapper<UserJTO, User> userMapper;


    @override
  Future<User> updateUser({required String id, required User user, FormData? photo}) async {
    try {
      final updatedUser = await userService.updateUser(id, userMapper.toDTO(user), photo);

      return userMapper.fromDTO(updatedUser);
    } catch (error,stack) {
      logger.e('Error updating taskin: $error, in the stack : \n $stack');
      throw Exception('Update failed');
    }
  }
}
