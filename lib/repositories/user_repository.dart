import 'dart:io';

import 'package:pine/utils/dto_mapper.dart';
import 'package:pomo/services/network/user/user_service.dart';

import '../models/user/user.dart';
import '../services/network/jto/user/user_jto.dart';

/// Abstract class of UserRepository
abstract class UserRepository {
  Future<String> searchUsername({required String username});

  Future<User> updateUser({
    required String id,
    required User user,
  });

  Future<User> updateUserPhoto({
    required String id,
    required File photo,
  });

  Future<void> deleteUser({required String id});

  Future<User> deleteUserPhoto({required String userId});
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
  Future<String> searchUsername({required String username}) async {
    final searchedUsername = await userService.searchUsername(username);
    return searchedUsername;
  }

  @override
  Future<User> updateUser({required String id, required User user}) async {
    final updatedUser = await userService.updateUser(id, userMapper.toDTO(user));

    return userMapper.fromDTO(updatedUser);
  }

  @override
  Future<User> updateUserPhoto({required String id, required File photo}) async {
    final updatedUser = await userService.updateUserPhoto(id, photo);
    return userMapper.fromDTO(updatedUser);
  }

  @override
  Future<void> deleteUser({required String id}) async {
    await userService.deleteUser(id);
  }

  @override
  Future<User> deleteUserPhoto({required String userId}) async {
    final user = await userService.deleteUserPhoto(userId);
    return userMapper.fromDTO(user);
  }
}
