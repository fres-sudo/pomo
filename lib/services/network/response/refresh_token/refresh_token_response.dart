import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_response.g.dart';

part 'refresh_token_response.freezed.dart';

@freezed
class RefreshTokenResponse extends DTO with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    required String accessToken,
    required String refreshToken
}) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
    _$RefreshTokenResponseFromJson(json);
}
