import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../jto/user/user_jto.dart';

part 'sign_in_response.g.dart';

part 'sign_in_response.freezed.dart';

@freezed
class SignInResponse extends DTO with _$SignInResponse {
  const factory SignInResponse({
    required String token,
    required String status,
    required UserJTO user,
}) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
    _$SignInResponseFromJson(json);
}
