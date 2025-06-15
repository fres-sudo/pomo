// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    _SignUpResponse(
      status: json['status'] as String,
      token: json['token'] as String,
      user: UserJTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseToJson(_SignUpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'user': instance.user,
    };
