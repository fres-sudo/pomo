// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_jto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserJTO _$UserJTOFromJson(Map<String, dynamic> json) {
  return _UserJTO.fromJson(json);
}

/// @nodoc
mixin _$UserJTO {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserJTOCopyWith<UserJTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserJTOCopyWith<$Res> {
  factory $UserJTOCopyWith(UserJTO value, $Res Function(UserJTO) then) =
      _$UserJTOCopyWithImpl<$Res, UserJTO>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String username,
      String email,
      String token});
}

/// @nodoc
class _$UserJTOCopyWithImpl<$Res, $Val extends UserJTO>
    implements $UserJTOCopyWith<$Res> {
  _$UserJTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserJTOImplCopyWith<$Res> implements $UserJTOCopyWith<$Res> {
  factory _$$UserJTOImplCopyWith(
          _$UserJTOImpl value, $Res Function(_$UserJTOImpl) then) =
      __$$UserJTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String username,
      String email,
      String token});
}

/// @nodoc
class __$$UserJTOImplCopyWithImpl<$Res>
    extends _$UserJTOCopyWithImpl<$Res, _$UserJTOImpl>
    implements _$$UserJTOImplCopyWith<$Res> {
  __$$UserJTOImplCopyWithImpl(
      _$UserJTOImpl _value, $Res Function(_$UserJTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? token = null,
  }) {
    return _then(_$UserJTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserJTOImpl implements _UserJTO {
  const _$UserJTOImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.username,
      required this.email,
      required this.token});

  factory _$UserJTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserJTOImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String token;

  @override
  String toString() {
    return 'UserJTO(id: $id, username: $username, email: $email, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserJTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserJTOImplCopyWith<_$UserJTOImpl> get copyWith =>
      __$$UserJTOImplCopyWithImpl<_$UserJTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserJTOImplToJson(
      this,
    );
  }
}

abstract class _UserJTO implements UserJTO {
  const factory _UserJTO(
      {@JsonKey(name: '_id') required final String id,
      required final String username,
      required final String email,
      required final String token}) = _$UserJTOImpl;

  factory _UserJTO.fromJson(Map<String, dynamic> json) = _$UserJTOImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$UserJTOImplCopyWith<_$UserJTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
