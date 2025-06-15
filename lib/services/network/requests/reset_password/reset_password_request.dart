import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.g.dart';

part 'reset_password_request.freezed.dart';

@freezed
sealed class ResetPasswordRequest extends DTO with _$ResetPasswordRequest {
  const ResetPasswordRequest._() : super();
  const factory ResetPasswordRequest(
      {required String email,
      required String newPassword,
      required String confirmNewPassword}) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
}
