
import 'package:pine/pine.dart';

import '../../models/user/user.dart';
import '../../services/network/response/sign_in/sign_in_response.dart';

class SignInResponseMapper extends DTOMapper<SignInResponse, User> {
  @override
  User fromDTO(SignInResponse dto) => User(
    id: dto.user.id,
    username: dto.user.username,
    email: dto.user.email,
    token: dto.token,
  );

  @override
  SignInResponse toDTO(User model) {
    throw UnimplementedError();
  }
}