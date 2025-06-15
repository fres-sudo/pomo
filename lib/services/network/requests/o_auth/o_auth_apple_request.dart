import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'o_auth_apple_request.g.dart';

part 'o_auth_apple_request.freezed.dart';

@freezed
sealed class OAuthAppleRequest extends DTO with _$OAuthAppleRequest {
  const OAuthAppleRequest._() : super();

  const factory OAuthAppleRequest({
    String? email,
    required String authorizationCode,
  }) = _OAuthAppleRequest;

  factory OAuthAppleRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthAppleRequestFromJson(json);
}
