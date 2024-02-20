import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

part 'sign_up_request.freezed.dart';

@freezed
class SignUpRequest extends DTO with _$SignUpRequest {
  const factory SignUpRequest({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
    _$SignUpRequestFromJson(json);
}
