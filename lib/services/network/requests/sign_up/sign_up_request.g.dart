// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpRequestImpl _$$SignUpRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignUpRequestImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );

Map<String, dynamic> _$$SignUpRequestImplToJson(_$SignUpRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
