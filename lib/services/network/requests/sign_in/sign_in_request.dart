import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request.g.dart';

part 'sign_in_request.freezed.dart';

@freezed
class SignInRequest extends DTO with _$SignInRequest {
  const factory SignInRequest({
    required String email,
    required String password,
}) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
    _$SignInRequestFromJson(json);
}
