// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_jto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserJTO _$UserJTOFromJson(Map<String, dynamic> json) => _UserJTO(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserJTOToJson(_UserJTO instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt.toIso8601String(),
    };
