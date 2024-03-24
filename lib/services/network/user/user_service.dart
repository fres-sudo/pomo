import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../jto/user/user_jto.dart';

part 'user_service.g.dart';

/// Abstract class of UserService
@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;


  @PUT('/users/{id}')
  @MultiPart()
  Future<UserJTO> updateUser(@Path('id') String id ,@Body() UserJTO user, @Part() FormData? photo,);

  @PUT('/users/{id}')
  @MultiPart()
  Future<UserJTO> updateUser2(@Path('id') String id ,@Body() UserJTO user, @Part() File? photo,);
}