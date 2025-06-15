import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
sealed class SignUpRequest extends DTO with _$SignUpRequest {
  const SignUpRequest._() : super();
  const factory SignUpRequest({
    required String name,
    required String email,
    required String password,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
