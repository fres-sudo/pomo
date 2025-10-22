// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_jto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserJTO _$UserJTOFromJson(Map<String, dynamic> json) => _UserJTO(
      id: json['id'] as String,
      username: json['name'] as String,
      email: json['email'] as String,
      avatar: json['image'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserJTOToJson(_UserJTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.username,
      'email': instance.email,
      'image': instance.avatar,
      'createdAt': instance.createdAt.toIso8601String(),
    };
