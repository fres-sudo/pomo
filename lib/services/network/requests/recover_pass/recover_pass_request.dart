import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_pass_request.g.dart';

part 'recover_pass_request.freezed.dart';

@freezed
class RecoverPassRequest extends DTO with _$RecoverPassRequest {
  const factory RecoverPassRequest({
    required String password,
    required String confirmPassword
}) = _RecoverPassRequest;

  factory RecoverPassRequest.fromJson(Map<String, dynamic> json) =>
    _$RecoverPassRequestFromJson(json);
}
