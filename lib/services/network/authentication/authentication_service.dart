import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../requests/sign_in/sign_in_request.dart';
import '../requests/sign_up/sign_up_request.dart';
import '../response/sign_in/sign_in_response.dart';
import '../response/sign_up/sign_up_response.dart';

part 'authentication_service.g.dart';


/// Abstract class of AuthenticationService
@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) = _AuthenticationService;

  @POST('/api/v1/users/login')
  Future<SignInResponse> signIn(@Body() SignInRequest request);
  @POST('/api/v1/users/signup')
  Future<SignUpResponse> signUp(@Body() SignUpRequest request);
}                                                                     