import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'o_auth_google_request.g.dart';

part 'o_auth_google_request.freezed.dart';

@freezed
sealed class OAuthGoogleRequest extends DTO with _$OAuthGoogleRequest {
  const OAuthGoogleRequest._() : super();
  const factory OAuthGoogleRequest({
    required String username,
    required String email,
    String? avatar,
    String? providerUserId,
  }) = _OAuthGoogleRequest;

  factory OAuthGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthGoogleRequestFromJson(json);
}
