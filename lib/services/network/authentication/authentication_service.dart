import 'package:dio/dio.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../requests/o_auth/o_auth_request.dart';
import '../requests/sign_in/sign_in_request.dart';
import '../requests/sign_up/sign_up_request.dart';
import '../response/sign_up/sign_up_response.dart';

part 'authentication_service.g.dart';

/// Abstract class of AuthenticationService
@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @POST('/auth/login')
  Future<UserJTO> signIn(@Body() SignInRequest request);
  @POST('/auth/signup')
  Future<SignUpResponse> signUp(@Body() SignUpRequest request);
  @POST('/auth/google')
  Future<UserJTO> retrieveGoogleUser(@Body() OAuthRequest request);
  @POST('/auth/apple')
  Future<UserJTO> retrieveAppleUser(@Body() OAuthRequest request);
}

