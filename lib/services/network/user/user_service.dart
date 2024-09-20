import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pomo/services/network/response/forgot_pass/forgot_pass_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../jto/user/user_jto.dart';
import '../requests/forgot_pass/forgot_pass_request.dart';
import '../requests/recover_pass/recover_pass_request.dart';

part 'user_service.g.dart';

/// Abstract class of UserService
@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;


  @GET("/users")
  Future<String> searchUsername(@Query('username') String username);

  @PATCH('/users/{userId}')
  Future<UserJTO> updateUser(@Path('userId') String id ,@Body() UserJTO user);

 @DELETE('/users/{id}')
  Future<UserJTO> deleteUser(@Path('id') String id);

  @PUT('/users/uploadPhoto/{id}')
  @MultiPart()
  Future<UserJTO> updateUserPhoto(@Path('id') String id, @Part() File photo);

  @POST('/users/forgotPassword')
  Future<ForgotPassResponse> forgotPassword(@Body() ForgotPassRequest request);

  @PATCH('/users/recoverPassword/{token}')
  Future<void> recoverPassword(@Path('token') String token, @Body() RecoverPassRequest request);
}