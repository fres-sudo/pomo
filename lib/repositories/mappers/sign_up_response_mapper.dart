import 'package:pine/pine.dart';
import 'package:pomo/models/user/user.dart';
import '../../services/network/response/sign_up/sign_up_response.dart';

class SignUpResponseMapper extends DTOMapper<SignUpResponse, User> {
  const SignUpResponseMapper();

  @override
  User fromDTO(SignUpResponse dto) => User(
    id: dto.user.id,
    username: dto.user.username,
    email: dto.user.email,
  );

  @override
  SignUpResponse toDTO(User model) => throw UnimplementedError();

}
