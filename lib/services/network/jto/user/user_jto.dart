import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_jto.g.dart';

part 'user_jto.freezed.dart';

@freezed
class UserJTO extends DTO with _$UserJTO {
  const factory UserJTO({
    // ignore: invalid_annotation_target
    @JsonKey(name:'_id')required String id,
    required String username,
    required String email,

}) = _UserJTO;

  factory UserJTO.fromJson(Map<String, dynamic> json) =>
    _$UserJTOFromJson(json);
}
