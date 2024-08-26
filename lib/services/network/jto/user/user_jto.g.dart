// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_jto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserJTOImpl _$$UserJTOImplFromJson(Map<String, dynamic> json) =>
    _$UserJTOImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserJTOImplToJson(_$UserJTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt.toIso8601String(),
    };
