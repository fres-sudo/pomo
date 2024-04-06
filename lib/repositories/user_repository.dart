import 'dart:io';

import 'package:pine/utils/dto_mapper.dart';
import 'package:pomo/services/network/response/forgot_pass/forgot_pass_response.dart';
import 'package:pomo/services/network/user/user_service.dart';

import '../constants/constants.dart';
import '../models/user/user.dart';
import '../services/network/jto/user/user_jto.dart';

/// Abstract class of UserRepository
abstract class UserRepository {
  Future<User> updateUser({
      required String id,
      required User user,
 });
  Future<User> updateUserPhoto({
      required String id,
      required File photo,
 });
  Future<ForgotPassResponse> forgotPassword({
      required String email,
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
  Future<User> updateUser({required String id, required User user}) async {
    try {
      final updatedUser = await userService.updateUser(id, userMapper.toDTO(user));

      return userMapper.fromDTO(updatedUser);
    } catch (error,stack) {
      logger.e('Error updating taskin: $error, in the stack : \n $stack');
      throw Exception('Update failed');
    }
  }
  @override
  Future<User> updateUserPhoto({required String id, required File photo}) async {
    try {
      final updatedUser = await userService.updateUserPhoto(id, photo);

      return userMapper.fromDTO(updatedUser);
    } catch (error,stack) {
      logger.e('Error updating taskin: $error, in the stack : \n $stack');
      throw Exception('Update failed');
    }
  }

  @override
  Future<ForgotPassResponse> forgotPassword({required String email}) async {
    try {
      final otp = await userService.forgotPassword(email);
      return otp;
    } catch (error,stack) {
      logger.e('Error forgot password: $error, in the stack : \n $stack');
      throw Exception('Update failed');
    }
  }

}
