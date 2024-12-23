// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpEvent {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String email, String password,
            String confirmPassword)
        perform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String email, String password,
            String confirmPassword)?
        perform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String email, String password,
            String confirmPassword)?
        perform,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformSignUpEvent value) perform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformSignUpEvent value)? perform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformSignUpEvent value)? perform,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpEventCopyWith<SignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
  @useResult
  $Res call(
      {String username, String email, String password, String confirmPassword});
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformSignUpEventImplCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory _$$PerformSignUpEventImplCopyWith(_$PerformSignUpEventImpl value,
          $Res Function(_$PerformSignUpEventImpl) then) =
      __$$PerformSignUpEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username, String email, String password, String confirmPassword});
}

/// @nodoc
class __$$PerformSignUpEventImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$PerformSignUpEventImpl>
    implements _$$PerformSignUpEventImplCopyWith<$Res> {
  __$$PerformSignUpEventImplCopyWithImpl(_$PerformSignUpEventImpl _value,
      $Res Function(_$PerformSignUpEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$PerformSignUpEventImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PerformSignUpEventImpl implements PerformSignUpEvent {
  const _$PerformSignUpEventImpl(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'SignUpEvent.perform(username: $username, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformSignUpEventImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password, confirmPassword);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformSignUpEventImplCopyWith<_$PerformSignUpEventImpl> get copyWith =>
      __$$PerformSignUpEventImplCopyWithImpl<_$PerformSignUpEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String email, String password,
            String confirmPassword)
        perform,
  }) {
    return perform(username, email, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String email, String password,
            String confirmPassword)?
        perform,
  }) {
    return perform?.call(username, email, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String email, String password,
            String confirmPassword)?
        perform,
    required TResult orElse(),
  }) {
    if (perform != null) {
      return perform(username, email, password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformSignUpEvent value) perform,
  }) {
    return perform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformSignUpEvent value)? perform,
  }) {
    return perform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformSignUpEvent value)? perform,
    required TResult orElse(),
  }) {
    if (perform != null) {
      return perform(this);
    }
    return orElse();
  }
}

abstract class PerformSignUpEvent implements SignUpEvent {
  const factory PerformSignUpEvent(
      {required final String username,
      required final String email,
      required final String password,
      required final String confirmPassword}) = _$PerformSignUpEventImpl;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformSignUpEventImplCopyWith<_$PerformSignUpEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedUp,
    required TResult Function() signingUp,
    required TResult Function(User user) signedUp,
    required TResult Function(LocalizedError error) errorSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedUp,
    TResult? Function()? signingUp,
    TResult? Function(User user)? signedUp,
    TResult? Function(LocalizedError error)? errorSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedUp,
    TResult Function()? signingUp,
    TResult Function(User user)? signedUp,
    TResult Function(LocalizedError error)? errorSignUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedUpSignUpState value) notSignedUp,
    required TResult Function(SigningUpSignUpState value) signingUp,
    required TResult Function(SignedUpSignUpState value) signedUp,
    required TResult Function(ErrorSignUpSignUpState value) errorSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult? Function(SigningUpSignUpState value)? signingUp,
    TResult? Function(SignedUpSignUpState value)? signedUp,
    TResult? Function(ErrorSignUpSignUpState value)? errorSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult Function(SigningUpSignUpState value)? signingUp,
    TResult Function(SignedUpSignUpState value)? signedUp,
    TResult Function(ErrorSignUpSignUpState value)? errorSignUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NotSignedUpSignUpStateImplCopyWith<$Res> {
  factory _$$NotSignedUpSignUpStateImplCopyWith(
          _$NotSignedUpSignUpStateImpl value,
          $Res Function(_$NotSignedUpSignUpStateImpl) then) =
      __$$NotSignedUpSignUpStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotSignedUpSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$NotSignedUpSignUpStateImpl>
    implements _$$NotSignedUpSignUpStateImplCopyWith<$Res> {
  __$$NotSignedUpSignUpStateImplCopyWithImpl(
      _$NotSignedUpSignUpStateImpl _value,
      $Res Function(_$NotSignedUpSignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotSignedUpSignUpStateImpl implements NotSignedUpSignUpState {
  const _$NotSignedUpSignUpStateImpl();

  @override
  String toString() {
    return 'SignUpState.notSignedUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotSignedUpSignUpStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedUp,
    required TResult Function() signingUp,
    required TResult Function(User user) signedUp,
    required TResult Function(LocalizedError error) errorSignUp,
  }) {
    return notSignedUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedUp,
    TResult? Function()? signingUp,
    TResult? Function(User user)? signedUp,
    TResult? Function(LocalizedError error)? errorSignUp,
  }) {
    return notSignedUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedUp,
    TResult Function()? signingUp,
    TResult Function(User user)? signedUp,
    TResult Function(LocalizedError error)? errorSignUp,
    required TResult orElse(),
  }) {
    if (notSignedUp != null) {
      return notSignedUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedUpSignUpState value) notSignedUp,
    required TResult Function(SigningUpSignUpState value) signingUp,
    required TResult Function(SignedUpSignUpState value) signedUp,
    required TResult Function(ErrorSignUpSignUpState value) errorSignUp,
  }) {
    return notSignedUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult? Function(SigningUpSignUpState value)? signingUp,
    TResult? Function(SignedUpSignUpState value)? signedUp,
    TResult? Function(ErrorSignUpSignUpState value)? errorSignUp,
  }) {
    return notSignedUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult Function(SigningUpSignUpState value)? signingUp,
    TResult Function(SignedUpSignUpState value)? signedUp,
    TResult Function(ErrorSignUpSignUpState value)? errorSignUp,
    required TResult orElse(),
  }) {
    if (notSignedUp != null) {
      return notSignedUp(this);
    }
    return orElse();
  }
}

abstract class NotSignedUpSignUpState implements SignUpState {
  const factory NotSignedUpSignUpState() = _$NotSignedUpSignUpStateImpl;
}

/// @nodoc
abstract class _$$SigningUpSignUpStateImplCopyWith<$Res> {
  factory _$$SigningUpSignUpStateImplCopyWith(_$SigningUpSignUpStateImpl value,
          $Res Function(_$SigningUpSignUpStateImpl) then) =
      __$$SigningUpSignUpStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigningUpSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SigningUpSignUpStateImpl>
    implements _$$SigningUpSignUpStateImplCopyWith<$Res> {
  __$$SigningUpSignUpStateImplCopyWithImpl(_$SigningUpSignUpStateImpl _value,
      $Res Function(_$SigningUpSignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SigningUpSignUpStateImpl implements SigningUpSignUpState {
  const _$SigningUpSignUpStateImpl();

  @override
  String toString() {
    return 'SignUpState.signingUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigningUpSignUpStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedUp,
    required TResult Function() signingUp,
    required TResult Function(User user) signedUp,
    required TResult Function(LocalizedError error) errorSignUp,
  }) {
    return signingUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedUp,
    TResult? Function()? signingUp,
    TResult? Function(User user)? signedUp,
    TResult? Function(LocalizedError error)? errorSignUp,
  }) {
    return signingUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedUp,
    TResult Function()? signingUp,
    TResult Function(User user)? signedUp,
    TResult Function(LocalizedError error)? errorSignUp,
    required TResult orElse(),
  }) {
    if (signingUp != null) {
      return signingUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedUpSignUpState value) notSignedUp,
    required TResult Function(SigningUpSignUpState value) signingUp,
    required TResult Function(SignedUpSignUpState value) signedUp,
    required TResult Function(ErrorSignUpSignUpState value) errorSignUp,
  }) {
    return signingUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult? Function(SigningUpSignUpState value)? signingUp,
    TResult? Function(SignedUpSignUpState value)? signedUp,
    TResult? Function(ErrorSignUpSignUpState value)? errorSignUp,
  }) {
    return signingUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult Function(SigningUpSignUpState value)? signingUp,
    TResult Function(SignedUpSignUpState value)? signedUp,
    TResult Function(ErrorSignUpSignUpState value)? errorSignUp,
    required TResult orElse(),
  }) {
    if (signingUp != null) {
      return signingUp(this);
    }
    return orElse();
  }
}

abstract class SigningUpSignUpState implements SignUpState {
  const factory SigningUpSignUpState() = _$SigningUpSignUpStateImpl;
}

/// @nodoc
abstract class _$$SignedUpSignUpStateImplCopyWith<$Res> {
  factory _$$SignedUpSignUpStateImplCopyWith(_$SignedUpSignUpStateImpl value,
          $Res Function(_$SignedUpSignUpStateImpl) then) =
      __$$SignedUpSignUpStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignedUpSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignedUpSignUpStateImpl>
    implements _$$SignedUpSignUpStateImplCopyWith<$Res> {
  __$$SignedUpSignUpStateImplCopyWithImpl(_$SignedUpSignUpStateImpl _value,
      $Res Function(_$SignedUpSignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SignedUpSignUpStateImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$SignedUpSignUpStateImpl implements SignedUpSignUpState {
  const _$SignedUpSignUpStateImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'SignUpState.signedUp(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedUpSignUpStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedUpSignUpStateImplCopyWith<_$SignedUpSignUpStateImpl> get copyWith =>
      __$$SignedUpSignUpStateImplCopyWithImpl<_$SignedUpSignUpStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedUp,
    required TResult Function() signingUp,
    required TResult Function(User user) signedUp,
    required TResult Function(LocalizedError error) errorSignUp,
  }) {
    return signedUp(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedUp,
    TResult? Function()? signingUp,
    TResult? Function(User user)? signedUp,
    TResult? Function(LocalizedError error)? errorSignUp,
  }) {
    return signedUp?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedUp,
    TResult Function()? signingUp,
    TResult Function(User user)? signedUp,
    TResult Function(LocalizedError error)? errorSignUp,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedUpSignUpState value) notSignedUp,
    required TResult Function(SigningUpSignUpState value) signingUp,
    required TResult Function(SignedUpSignUpState value) signedUp,
    required TResult Function(ErrorSignUpSignUpState value) errorSignUp,
  }) {
    return signedUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult? Function(SigningUpSignUpState value)? signingUp,
    TResult? Function(SignedUpSignUpState value)? signedUp,
    TResult? Function(ErrorSignUpSignUpState value)? errorSignUp,
  }) {
    return signedUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult Function(SigningUpSignUpState value)? signingUp,
    TResult Function(SignedUpSignUpState value)? signedUp,
    TResult Function(ErrorSignUpSignUpState value)? errorSignUp,
    required TResult orElse(),
  }) {
    if (signedUp != null) {
      return signedUp(this);
    }
    return orElse();
  }
}

abstract class SignedUpSignUpState implements SignUpState {
  const factory SignedUpSignUpState(final User user) =
      _$SignedUpSignUpStateImpl;

  User get user;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignedUpSignUpStateImplCopyWith<_$SignedUpSignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSignUpSignUpStateImplCopyWith<$Res> {
  factory _$$ErrorSignUpSignUpStateImplCopyWith(
          _$ErrorSignUpSignUpStateImpl value,
          $Res Function(_$ErrorSignUpSignUpStateImpl) then) =
      __$$ErrorSignUpSignUpStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocalizedError error});
}

/// @nodoc
class __$$ErrorSignUpSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$ErrorSignUpSignUpStateImpl>
    implements _$$ErrorSignUpSignUpStateImplCopyWith<$Res> {
  __$$ErrorSignUpSignUpStateImplCopyWithImpl(
      _$ErrorSignUpSignUpStateImpl _value,
      $Res Function(_$ErrorSignUpSignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorSignUpSignUpStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedError,
    ));
  }
}

/// @nodoc

class _$ErrorSignUpSignUpStateImpl implements ErrorSignUpSignUpState {
  const _$ErrorSignUpSignUpStateImpl(this.error);

  @override
  final LocalizedError error;

  @override
  String toString() {
    return 'SignUpState.errorSignUp(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSignUpSignUpStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSignUpSignUpStateImplCopyWith<_$ErrorSignUpSignUpStateImpl>
      get copyWith => __$$ErrorSignUpSignUpStateImplCopyWithImpl<
          _$ErrorSignUpSignUpStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedUp,
    required TResult Function() signingUp,
    required TResult Function(User user) signedUp,
    required TResult Function(LocalizedError error) errorSignUp,
  }) {
    return errorSignUp(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedUp,
    TResult? Function()? signingUp,
    TResult? Function(User user)? signedUp,
    TResult? Function(LocalizedError error)? errorSignUp,
  }) {
    return errorSignUp?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedUp,
    TResult Function()? signingUp,
    TResult Function(User user)? signedUp,
    TResult Function(LocalizedError error)? errorSignUp,
    required TResult orElse(),
  }) {
    if (errorSignUp != null) {
      return errorSignUp(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedUpSignUpState value) notSignedUp,
    required TResult Function(SigningUpSignUpState value) signingUp,
    required TResult Function(SignedUpSignUpState value) signedUp,
    required TResult Function(ErrorSignUpSignUpState value) errorSignUp,
  }) {
    return errorSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult? Function(SigningUpSignUpState value)? signingUp,
    TResult? Function(SignedUpSignUpState value)? signedUp,
    TResult? Function(ErrorSignUpSignUpState value)? errorSignUp,
  }) {
    return errorSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedUpSignUpState value)? notSignedUp,
    TResult Function(SigningUpSignUpState value)? signingUp,
    TResult Function(SignedUpSignUpState value)? signedUp,
    TResult Function(ErrorSignUpSignUpState value)? errorSignUp,
    required TResult orElse(),
  }) {
    if (errorSignUp != null) {
      return errorSignUp(this);
    }
    return orElse();
  }
}

abstract class ErrorSignUpSignUpState implements SignUpState {
  const factory ErrorSignUpSignUpState(final LocalizedError error) =
      _$ErrorSignUpSignUpStateImpl;

  LocalizedError get error;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSignUpSignUpStateImplCopyWith<_$ErrorSignUpSignUpStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
