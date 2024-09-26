import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pomo/services/network/response/forgot_pass/forgot_pass_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../jto/user/user_jto.dart';
part 'user_service.g.dart';

/// Abstract class of UserService
@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;


  @GET("/users")
  Future<String> searchUsername(@Query('username') String username);

  @PATCH('/users/{userId}')
  Future<UserJTO> updateUser(@Path('userId') String id ,@Body() UserJTO user);

  @DELETE('/users/{userId}')
  Future<UserJTO> deleteUser(@Path('userId') String id);

  @PUT('/users/image/{id}')
  @MultiPart()
  Future<UserJTO> updateUserPhoto(@Path('id') String id, @Part() File photo);

  @DELETE("/users/image/{userId}")
  Future<UserJTO> deleteUserPhoto(@Path('userId') String userId,);

}