import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_request.g.dart';

part 'forgot_pass_request.freezed.dart';

@freezed
class ForgotPasswordRequest extends DTO with _$ForgotPasswordRequest {
  const factory ForgotPasswordRequest({
    required String email,
}) = _ForgotPassRequest;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
    _$ForgotPasswordRequestFromJson(json);
}
