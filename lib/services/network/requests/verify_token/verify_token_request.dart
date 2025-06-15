import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_token_request.g.dart';

part 'verify_token_request.freezed.dart';

@freezed
sealed class VerifyTokenRequest extends DTO with _$VerifyTokenRequest {
  const VerifyTokenRequest._() : super();
  const factory VerifyTokenRequest(
      {required String email, required String token}) = _VerifyTokenRequest;

  factory VerifyTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyTokenRequestFromJson(json);
}
