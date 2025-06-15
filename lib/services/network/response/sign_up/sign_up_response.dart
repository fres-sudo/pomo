import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../jto/user/user_jto.dart';

part 'sign_up_response.g.dart';

part 'sign_up_response.freezed.dart';

@freezed
sealed class SignUpResponse extends DTO with _$SignUpResponse {
  const SignUpResponse._() : super();
  const factory SignUpResponse({
    required String status,
    required String token,
    required UserJTO user,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
