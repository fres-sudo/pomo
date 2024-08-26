import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_jto.g.dart';

part 'user_jto.freezed.dart';

@freezed
class UserJTO extends DTO with _$UserJTO {
  const factory UserJTO({
    required String id,
    required String username,
    required String email,
    String? avatar,
    required DateTime createdAt,
  }) = _UserJTO;

  factory UserJTO.fromJson(Map<String, dynamic> json) =>
      _$UserJTOFromJson(json);
}
