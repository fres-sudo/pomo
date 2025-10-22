import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../jto/user/user_jto.dart';

part 'sign_in_response.g.dart';

part 'sign_in_response.freezed.dart';

@freezed
sealed class SignInResponse extends DTO with _$SignInResponse {
  const SignInResponse._() : super();
  const factory SignInResponse({
    @JsonKey(name: 'token') required String accessToken,
    required UserJTO user,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);
}
