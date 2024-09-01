import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'o_auth_request.g.dart';

part 'o_auth_request.freezed.dart';

@freezed
class OAuthRequest extends DTO with _$OAuthRequest {
  const factory OAuthRequest({
    required String username,
    required String email,
    String? avatar,
}) = _OAuthRequest;

  factory OAuthRequest.fromJson(Map<String, dynamic> json) =>
    _$OAuthRequestFromJson(json);
}
