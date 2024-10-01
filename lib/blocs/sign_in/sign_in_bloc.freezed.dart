// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) perform,
    required TResult Function() google,
    required TResult Function() apple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? perform,
    TResult? Function()? google,
    TResult? Function()? apple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? perform,
    TResult Function()? google,
    TResult Function()? apple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformSignInEvent value) perform,
    required TResult Function(GoogleSignInEvent value) google,
    required TResult Function(AppleSignInEvent value) apple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformSignInEvent value)? perform,
    TResult? Function(GoogleSignInEvent value)? google,
    TResult? Function(AppleSignInEvent value)? apple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformSignInEvent value)? perform,
    TResult Function(GoogleSignInEvent value)? google,
    TResult Function(AppleSignInEvent value)? apple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PerformSignInEventImplCopyWith<$Res> {
  factory _$$PerformSignInEventImplCopyWith(_$PerformSignInEventImpl value,
          $Res Function(_$PerformSignInEventImpl) then) =
      __$$PerformSignInEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$PerformSignInEventImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$PerformSignInEventImpl>
    implements _$$PerformSignInEventImplCopyWith<$Res> {
  __$$PerformSignInEventImplCopyWithImpl(_$PerformSignInEventImpl _value,
      $Res Function(_$PerformSignInEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$PerformSignInEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PerformSignInEventImpl implements PerformSignInEvent {
  const _$PerformSignInEventImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInEvent.perform(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformSignInEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformSignInEventImplCopyWith<_$PerformSignInEventImpl> get copyWith =>
      __$$PerformSignInEventImplCopyWithImpl<_$PerformSignInEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) perform,
    required TResult Function() google,
    required TResult Function() apple,
  }) {
    return perform(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? perform,
    TResult? Function()? google,
    TResult? Function()? apple,
  }) {
    return perform?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? perform,
    TResult Function()? google,
    TResult Function()? apple,
    required TResult orElse(),
  }) {
    if (perform != null) {
      return perform(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformSignInEvent value) perform,
    required TResult Function(GoogleSignInEvent value) google,
    required TResult Function(AppleSignInEvent value) apple,
  }) {
    return perform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformSignInEvent value)? perform,
    TResult? Function(GoogleSignInEvent value)? google,
    TResult? Function(AppleSignInEvent value)? apple,
  }) {
    return perform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformSignInEvent value)? perform,
    TResult Function(GoogleSignInEvent value)? google,
    TResult Function(AppleSignInEvent value)? apple,
    required TResult orElse(),
  }) {
    if (perform != null) {
      return perform(this);
    }
    return orElse();
  }
}

abstract class PerformSignInEvent implements SignInEvent {
  const factory PerformSignInEvent(
      {required final String email,
      required final String password}) = _$PerformSignInEventImpl;

  String get email;
  String get password;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformSignInEventImplCopyWith<_$PerformSignInEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleSignInEventImplCopyWith<$Res> {
  factory _$$GoogleSignInEventImplCopyWith(_$GoogleSignInEventImpl value,
          $Res Function(_$GoogleSignInEventImpl) then) =
      __$$GoogleSignInEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleSignInEventImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$GoogleSignInEventImpl>
    implements _$$GoogleSignInEventImplCopyWith<$Res> {
  __$$GoogleSignInEventImplCopyWithImpl(_$GoogleSignInEventImpl _value,
      $Res Function(_$GoogleSignInEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleSignInEventImpl implements GoogleSignInEvent {
  const _$GoogleSignInEventImpl();

  @override
  String toString() {
    return 'SignInEvent.google()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleSignInEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) perform,
    required TResult Function() google,
    required TResult Function() apple,
  }) {
    return google();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? perform,
    TResult? Function()? google,
    TResult? Function()? apple,
  }) {
    return google?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? perform,
    TResult Function()? google,
    TResult Function()? apple,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformSignInEvent value) perform,
    required TResult Function(GoogleSignInEvent value) google,
    required TResult Function(AppleSignInEvent value) apple,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformSignInEvent value)? perform,
    TResult? Function(GoogleSignInEvent value)? google,
    TResult? Function(AppleSignInEvent value)? apple,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformSignInEvent value)? perform,
    TResult Function(GoogleSignInEvent value)? google,
    TResult Function(AppleSignInEvent value)? apple,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class GoogleSignInEvent implements SignInEvent {
  const factory GoogleSignInEvent() = _$GoogleSignInEventImpl;
}

/// @nodoc
abstract class _$$AppleSignInEventImplCopyWith<$Res> {
  factory _$$AppleSignInEventImplCopyWith(_$AppleSignInEventImpl value,
          $Res Function(_$AppleSignInEventImpl) then) =
      __$$AppleSignInEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleSignInEventImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$AppleSignInEventImpl>
    implements _$$AppleSignInEventImplCopyWith<$Res> {
  __$$AppleSignInEventImplCopyWithImpl(_$AppleSignInEventImpl _value,
      $Res Function(_$AppleSignInEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppleSignInEventImpl implements AppleSignInEvent {
  const _$AppleSignInEventImpl();

  @override
  String toString() {
    return 'SignInEvent.apple()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleSignInEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) perform,
    required TResult Function() google,
    required TResult Function() apple,
  }) {
    return apple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? perform,
    TResult? Function()? google,
    TResult? Function()? apple,
  }) {
    return apple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? perform,
    TResult Function()? google,
    TResult Function()? apple,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformSignInEvent value) perform,
    required TResult Function(GoogleSignInEvent value) google,
    required TResult Function(AppleSignInEvent value) apple,
  }) {
    return apple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformSignInEvent value)? perform,
    TResult? Function(GoogleSignInEvent value)? google,
    TResult? Function(AppleSignInEvent value)? apple,
  }) {
    return apple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformSignInEvent value)? perform,
    TResult Function(GoogleSignInEvent value)? google,
    TResult Function(AppleSignInEvent value)? apple,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple(this);
    }
    return orElse();
  }
}

abstract class AppleSignInEvent implements SignInEvent {
  const factory AppleSignInEvent() = _$AppleSignInEventImpl;
}

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NotSignedInSignInStateImplCopyWith<$Res> {
  factory _$$NotSignedInSignInStateImplCopyWith(
          _$NotSignedInSignInStateImpl value,
          $Res Function(_$NotSignedInSignInStateImpl) then) =
      __$$NotSignedInSignInStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotSignedInSignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$NotSignedInSignInStateImpl>
    implements _$$NotSignedInSignInStateImplCopyWith<$Res> {
  __$$NotSignedInSignInStateImplCopyWithImpl(
      _$NotSignedInSignInStateImpl _value,
      $Res Function(_$NotSignedInSignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotSignedInSignInStateImpl implements NotSignedInSignInState {
  const _$NotSignedInSignInStateImpl();

  @override
  String toString() {
    return 'SignInState.notSignedIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotSignedInSignInStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    return notSignedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    return notSignedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    if (notSignedIn != null) {
      return notSignedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    return notSignedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    return notSignedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    if (notSignedIn != null) {
      return notSignedIn(this);
    }
    return orElse();
  }
}

abstract class NotSignedInSignInState implements SignInState {
  const factory NotSignedInSignInState() = _$NotSignedInSignInStateImpl;
}

/// @nodoc
abstract class _$$SigningInSignInStateImplCopyWith<$Res> {
  factory _$$SigningInSignInStateImplCopyWith(_$SigningInSignInStateImpl value,
          $Res Function(_$SigningInSignInStateImpl) then) =
      __$$SigningInSignInStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigningInSignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SigningInSignInStateImpl>
    implements _$$SigningInSignInStateImplCopyWith<$Res> {
  __$$SigningInSignInStateImplCopyWithImpl(_$SigningInSignInStateImpl _value,
      $Res Function(_$SigningInSignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SigningInSignInStateImpl implements SigningInSignInState {
  const _$SigningInSignInStateImpl();

  @override
  String toString() {
    return 'SignInState.signingIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigningInSignInStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    return signingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    return signingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    return signingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class SigningInSignInState implements SignInState {
  const factory SigningInSignInState() = _$SigningInSignInStateImpl;
}

/// @nodoc
abstract class _$$SignedInSignInStateImplCopyWith<$Res> {
  factory _$$SignedInSignInStateImplCopyWith(_$SignedInSignInStateImpl value,
          $Res Function(_$SignedInSignInStateImpl) then) =
      __$$SignedInSignInStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignedInSignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignedInSignInStateImpl>
    implements _$$SignedInSignInStateImplCopyWith<$Res> {
  __$$SignedInSignInStateImplCopyWithImpl(_$SignedInSignInStateImpl _value,
      $Res Function(_$SignedInSignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SignedInSignInStateImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignInState
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

class _$SignedInSignInStateImpl implements SignedInSignInState {
  const _$SignedInSignInStateImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'SignInState.signedIn(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedInSignInStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedInSignInStateImplCopyWith<_$SignedInSignInStateImpl> get copyWith =>
      __$$SignedInSignInStateImplCopyWithImpl<_$SignedInSignInStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    return signedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    return signedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class SignedInSignInState implements SignInState {
  const factory SignedInSignInState(final User user) =
      _$SignedInSignInStateImpl;

  User get user;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignedInSignInStateImplCopyWith<_$SignedInSignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedInWithGoogleSignInStateImplCopyWith<$Res> {
  factory _$$SignedInWithGoogleSignInStateImplCopyWith(
          _$SignedInWithGoogleSignInStateImpl value,
          $Res Function(_$SignedInWithGoogleSignInStateImpl) then) =
      __$$SignedInWithGoogleSignInStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignedInWithGoogleSignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignedInWithGoogleSignInStateImpl>
    implements _$$SignedInWithGoogleSignInStateImplCopyWith<$Res> {
  __$$SignedInWithGoogleSignInStateImplCopyWithImpl(
      _$SignedInWithGoogleSignInStateImpl _value,
      $Res Function(_$SignedInWithGoogleSignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SignedInWithGoogleSignInStateImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignInState
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

class _$SignedInWithGoogleSignInStateImpl
    implements SignedInWithGoogleSignInState {
  const _$SignedInWithGoogleSignInStateImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'SignInState.signedInWithGoogle(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedInWithGoogleSignInStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedInWithGoogleSignInStateImplCopyWith<
          _$SignedInWithGoogleSignInStateImpl>
      get copyWith => __$$SignedInWithGoogleSignInStateImplCopyWithImpl<
          _$SignedInWithGoogleSignInStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    return signedInWithGoogle(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    return signedInWithGoogle?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signedInWithGoogle != null) {
      return signedInWithGoogle(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    return signedInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    return signedInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signedInWithGoogle != null) {
      return signedInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class SignedInWithGoogleSignInState implements SignInState {
  const factory SignedInWithGoogleSignInState(final User user) =
      _$SignedInWithGoogleSignInStateImpl;

  User get user;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignedInWithGoogleSignInStateImplCopyWith<
          _$SignedInWithGoogleSignInStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedInWithAppleSignInStateImplCopyWith<$Res> {
  factory _$$SignedInWithAppleSignInStateImplCopyWith(
          _$SignedInWithAppleSignInStateImpl value,
          $Res Function(_$SignedInWithAppleSignInStateImpl) then) =
      __$$SignedInWithAppleSignInStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignedInWithAppleSignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignedInWithAppleSignInStateImpl>
    implements _$$SignedInWithAppleSignInStateImplCopyWith<$Res> {
  __$$SignedInWithAppleSignInStateImplCopyWithImpl(
      _$SignedInWithAppleSignInStateImpl _value,
      $Res Function(_$SignedInWithAppleSignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SignedInWithAppleSignInStateImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignInState
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

class _$SignedInWithAppleSignInStateImpl
    implements SignedInWithAppleSignInState {
  const _$SignedInWithAppleSignInStateImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'SignInState.signedInWithApple(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedInWithAppleSignInStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedInWithAppleSignInStateImplCopyWith<
          _$SignedInWithAppleSignInStateImpl>
      get copyWith => __$$SignedInWithAppleSignInStateImplCopyWithImpl<
          _$SignedInWithAppleSignInStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    return signedInWithApple(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    return signedInWithApple?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signedInWithApple != null) {
      return signedInWithApple(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    return signedInWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    return signedInWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    if (signedInWithApple != null) {
      return signedInWithApple(this);
    }
    return orElse();
  }
}

abstract class SignedInWithAppleSignInState implements SignInState {
  const factory SignedInWithAppleSignInState(final User user) =
      _$SignedInWithAppleSignInStateImpl;

  User get user;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignedInWithAppleSignInStateImplCopyWith<
          _$SignedInWithAppleSignInStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSignInSignInStateImplCopyWith<$Res> {
  factory _$$ErrorSignInSignInStateImplCopyWith(
          _$ErrorSignInSignInStateImpl value,
          $Res Function(_$ErrorSignInSignInStateImpl) then) =
      __$$ErrorSignInSignInStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocalizedError error});
}

/// @nodoc
class __$$ErrorSignInSignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$ErrorSignInSignInStateImpl>
    implements _$$ErrorSignInSignInStateImplCopyWith<$Res> {
  __$$ErrorSignInSignInStateImplCopyWithImpl(
      _$ErrorSignInSignInStateImpl _value,
      $Res Function(_$ErrorSignInSignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorSignInSignInStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedError,
    ));
  }
}

/// @nodoc

class _$ErrorSignInSignInStateImpl implements ErrorSignInSignInState {
  const _$ErrorSignInSignInStateImpl(this.error);

  @override
  final LocalizedError error;

  @override
  String toString() {
    return 'SignInState.errorSignIn(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSignInSignInStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSignInSignInStateImplCopyWith<_$ErrorSignInSignInStateImpl>
      get copyWith => __$$ErrorSignInSignInStateImplCopyWithImpl<
          _$ErrorSignInSignInStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    return errorSignIn(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    return errorSignIn?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    if (errorSignIn != null) {
      return errorSignIn(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    return errorSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    return errorSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    if (errorSignIn != null) {
      return errorSignIn(this);
    }
    return orElse();
  }
}

abstract class ErrorSignInSignInState implements SignInState {
  const factory ErrorSignInSignInState(final LocalizedError error) =
      _$ErrorSignInSignInStateImpl;

  LocalizedError get error;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSignInSignInStateImplCopyWith<_$ErrorSignInSignInStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
