import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_request.g.dart';

part 'forgot_pass_request.freezed.dart';

@freezed
class ForgotPassRequest extends DTO with _$ForgotPassRequest {
  const factory ForgotPassRequest({
    required String email,
}) = _ForgotPassRequest;

  factory ForgotPassRequest.fromJson(Map<String, dynamic> json) =>
    _$ForgotPassRequestFromJson(json);
}
