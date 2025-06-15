import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_response.g.dart';

part 'forgot_pass_response.freezed.dart';

@freezed
sealed class ForgotPassResponse extends DTO with _$ForgotPassResponse {
  const ForgotPassResponse._();
  const factory ForgotPassResponse({
    required String resetOTP,
    required String resetToken,
  }) = _ForgotPassResponse;

  factory ForgotPassResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassResponseFromJson(json);
}
