// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_jto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserJTOImpl _$$UserJTOImplFromJson(Map<String, dynamic> json) =>
    _$UserJTOImpl(
      id: json['_id'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserJTOImplToJson(_$UserJTOImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'username': instance.username,
      'email': instance.email,
      'photo': instance.photo,
      'token': instance.token,
    };
