// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_jto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserJTO {
  String get id;
  @JsonKey(name: 'name')
  String get username;
  String get email;
  @JsonKey(name: 'image')
  String? get avatar;
  DateTime get createdAt;

  /// Create a copy of UserJTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserJTOCopyWith<UserJTO> get copyWith =>
      _$UserJTOCopyWithImpl<UserJTO>(this as UserJTO, _$identity);

  /// Serializes this UserJTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserJTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, avatar, createdAt);

  @override
  String toString() {
    return 'UserJTO(id: $id, username: $username, email: $email, avatar: $avatar, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserJTOCopyWith<$Res> {
  factory $UserJTOCopyWith(UserJTO value, $Res Function(UserJTO) _then) =
      _$UserJTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'name') String username,
      String email,
      @JsonKey(name: 'image') String? avatar,
      DateTime createdAt});
}

/// @nodoc
class _$UserJTOCopyWithImpl<$Res> implements $UserJTOCopyWith<$Res> {
  _$UserJTOCopyWithImpl(this._self, this._then);

  final UserJTO _self;
  final $Res Function(UserJTO) _then;

  /// Create a copy of UserJTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? avatar = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserJTO].
extension UserJTOPatterns on UserJTO {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserJTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserJTO() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserJTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserJTO():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserJTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserJTO() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'name') String username,
            String email,
            @JsonKey(name: 'image') String? avatar,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserJTO() when $default != null:
        return $default(_that.id, _that.username, _that.email, _that.avatar,
            _that.createdAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'name') String username,
            String email,
            @JsonKey(name: 'image') String? avatar,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserJTO():
        return $default(_that.id, _that.username, _that.email, _that.avatar,
            _that.createdAt);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'name') String username,
            String email,
            @JsonKey(name: 'image') String? avatar,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserJTO() when $default != null:
        return $default(_that.id, _that.username, _that.email, _that.avatar,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserJTO extends UserJTO {
  const _UserJTO(
      {required this.id,
      @JsonKey(name: 'name') required this.username,
      required this.email,
      @JsonKey(name: 'image') this.avatar,
      required this.createdAt})
      : super._();
  factory _UserJTO.fromJson(Map<String, dynamic> json) =>
      _$UserJTOFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'name')
  final String username;
  @override
  final String email;
  @override
  @JsonKey(name: 'image')
  final String? avatar;
  @override
  final DateTime createdAt;

  /// Create a copy of UserJTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserJTOCopyWith<_UserJTO> get copyWith =>
      __$UserJTOCopyWithImpl<_UserJTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserJTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserJTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, avatar, createdAt);

  @override
  String toString() {
    return 'UserJTO(id: $id, username: $username, email: $email, avatar: $avatar, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserJTOCopyWith<$Res> implements $UserJTOCopyWith<$Res> {
  factory _$UserJTOCopyWith(_UserJTO value, $Res Function(_UserJTO) _then) =
      __$UserJTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'name') String username,
      String email,
      @JsonKey(name: 'image') String? avatar,
      DateTime createdAt});
}

/// @nodoc
class __$UserJTOCopyWithImpl<$Res> implements _$UserJTOCopyWith<$Res> {
  __$UserJTOCopyWithImpl(this._self, this._then);

  final _UserJTO _self;
  final $Res Function(_UserJTO) _then;

  /// Create a copy of UserJTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? avatar = freezed,
    Object? createdAt = null,
  }) {
    return _then(_UserJTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
