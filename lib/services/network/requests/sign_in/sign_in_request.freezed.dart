// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInRequest {
  String get email;
  String get password;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInRequestCopyWith<SignInRequest> get copyWith =>
      _$SignInRequestCopyWithImpl<SignInRequest>(
          this as SignInRequest, _$identity);

  /// Serializes this SignInRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInRequest(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $SignInRequestCopyWith<$Res> {
  factory $SignInRequestCopyWith(
          SignInRequest value, $Res Function(SignInRequest) _then) =
      _$SignInRequestCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInRequestCopyWithImpl<$Res>
    implements $SignInRequestCopyWith<$Res> {
  _$SignInRequestCopyWithImpl(this._self, this._then);

  final SignInRequest _self;
  final $Res Function(SignInRequest) _then;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SignInRequest extends SignInRequest {
  const _SignInRequest({required this.email, required this.password})
      : super._();
  factory _SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  @override
  final String email;
  @override
  final String password;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInRequestCopyWith<_SignInRequest> get copyWith =>
      __$SignInRequestCopyWithImpl<_SignInRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignInRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInRequest(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$SignInRequestCopyWith<$Res>
    implements $SignInRequestCopyWith<$Res> {
  factory _$SignInRequestCopyWith(
          _SignInRequest value, $Res Function(_SignInRequest) _then) =
      __$SignInRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInRequestCopyWithImpl<$Res>
    implements _$SignInRequestCopyWith<$Res> {
  __$SignInRequestCopyWithImpl(this._self, this._then);

  final _SignInRequest _self;
  final $Res Function(_SignInRequest) _then;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_SignInRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
