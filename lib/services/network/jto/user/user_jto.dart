// ignore_for_file: invalid_annotation_target

import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_jto.g.dart';

part 'user_jto.freezed.dart';

@freezed
sealed class UserJTO extends DTO with _$UserJTO {
  const UserJTO._() : super();
  const factory UserJTO({
    required String id,
    @JsonKey(name: 'name') required String username,
    required String email,
    @JsonKey(name: 'image') String? avatar,
    required DateTime createdAt,
  }) = _UserJTO;

  factory UserJTO.fromJson(Map<String, dynamic> json) => _$UserJTOFromJson(json);
}
