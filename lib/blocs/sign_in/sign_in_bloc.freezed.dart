// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInEvent()';
  }
}

/// @nodoc
class $SignInEventCopyWith<$Res> {
  $SignInEventCopyWith(SignInEvent _, $Res Function(SignInEvent) __);
}

/// @nodoc

class PerformSignInEvent implements SignInEvent {
  const PerformSignInEvent({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PerformSignInEventCopyWith<PerformSignInEvent> get copyWith =>
      _$PerformSignInEventCopyWithImpl<PerformSignInEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PerformSignInEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInEvent.perform(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $PerformSignInEventCopyWith<$Res>
    implements $SignInEventCopyWith<$Res> {
  factory $PerformSignInEventCopyWith(
          PerformSignInEvent value, $Res Function(PerformSignInEvent) _then) =
      _$PerformSignInEventCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$PerformSignInEventCopyWithImpl<$Res>
    implements $PerformSignInEventCopyWith<$Res> {
  _$PerformSignInEventCopyWithImpl(this._self, this._then);

  final PerformSignInEvent _self;
  final $Res Function(PerformSignInEvent) _then;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(PerformSignInEvent(
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

class GoogleSignInEvent implements SignInEvent {
  const GoogleSignInEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GoogleSignInEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInEvent.google()';
  }
}

/// @nodoc

class AppleSignInEvent implements SignInEvent {
  const AppleSignInEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppleSignInEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInEvent.apple()';
  }
}

/// @nodoc
mixin _$SignInState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState()';
  }
}

/// @nodoc
class $SignInStateCopyWith<$Res> {
  $SignInStateCopyWith(SignInState _, $Res Function(SignInState) __);
}

/// @nodoc

class NotSignedInSignInState implements SignInState {
  const NotSignedInSignInState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotSignedInSignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.notSignedIn()';
  }
}

/// @nodoc

class SigningInSignInState implements SignInState {
  const SigningInSignInState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SigningInSignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.signingIn()';
  }
}

/// @nodoc

class SignedInSignInState implements SignInState {
  const SignedInSignInState(this.user);

  final User user;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignedInSignInStateCopyWith<SignedInSignInState> get copyWith =>
      _$SignedInSignInStateCopyWithImpl<SignedInSignInState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignedInSignInState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'SignInState.signedIn(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SignedInSignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $SignedInSignInStateCopyWith(
          SignedInSignInState value, $Res Function(SignedInSignInState) _then) =
      _$SignedInSignInStateCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SignedInSignInStateCopyWithImpl<$Res>
    implements $SignedInSignInStateCopyWith<$Res> {
  _$SignedInSignInStateCopyWithImpl(this._self, this._then);

  final SignedInSignInState _self;
  final $Res Function(SignedInSignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(SignedInSignInState(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class SignedInWithGoogleSignInState implements SignInState {
  const SignedInWithGoogleSignInState(this.user);

  final User user;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignedInWithGoogleSignInStateCopyWith<SignedInWithGoogleSignInState>
      get copyWith => _$SignedInWithGoogleSignInStateCopyWithImpl<
          SignedInWithGoogleSignInState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignedInWithGoogleSignInState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'SignInState.signedInWithGoogle(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SignedInWithGoogleSignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $SignedInWithGoogleSignInStateCopyWith(
          SignedInWithGoogleSignInState value,
          $Res Function(SignedInWithGoogleSignInState) _then) =
      _$SignedInWithGoogleSignInStateCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SignedInWithGoogleSignInStateCopyWithImpl<$Res>
    implements $SignedInWithGoogleSignInStateCopyWith<$Res> {
  _$SignedInWithGoogleSignInStateCopyWithImpl(this._self, this._then);

  final SignedInWithGoogleSignInState _self;
  final $Res Function(SignedInWithGoogleSignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(SignedInWithGoogleSignInState(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class SignedInWithAppleSignInState implements SignInState {
  const SignedInWithAppleSignInState(this.user);

  final User user;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignedInWithAppleSignInStateCopyWith<SignedInWithAppleSignInState>
      get copyWith => _$SignedInWithAppleSignInStateCopyWithImpl<
          SignedInWithAppleSignInState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignedInWithAppleSignInState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'SignInState.signedInWithApple(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SignedInWithAppleSignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $SignedInWithAppleSignInStateCopyWith(
          SignedInWithAppleSignInState value,
          $Res Function(SignedInWithAppleSignInState) _then) =
      _$SignedInWithAppleSignInStateCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SignedInWithAppleSignInStateCopyWithImpl<$Res>
    implements $SignedInWithAppleSignInStateCopyWith<$Res> {
  _$SignedInWithAppleSignInStateCopyWithImpl(this._self, this._then);

  final SignedInWithAppleSignInState _self;
  final $Res Function(SignedInWithAppleSignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(SignedInWithAppleSignInState(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class ErrorSignInSignInState implements SignInState {
  const ErrorSignInSignInState(this.error);

  final LocalizedError error;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorSignInSignInStateCopyWith<ErrorSignInSignInState> get copyWith =>
      _$ErrorSignInSignInStateCopyWithImpl<ErrorSignInSignInState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorSignInSignInState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SignInState.errorSignIn(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorSignInSignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $ErrorSignInSignInStateCopyWith(ErrorSignInSignInState value,
          $Res Function(ErrorSignInSignInState) _then) =
      _$ErrorSignInSignInStateCopyWithImpl;
  @useResult
  $Res call({LocalizedError error});
}

/// @nodoc
class _$ErrorSignInSignInStateCopyWithImpl<$Res>
    implements $ErrorSignInSignInStateCopyWith<$Res> {
  _$ErrorSignInSignInStateCopyWithImpl(this._self, this._then);

  final ErrorSignInSignInState _self;
  final $Res Function(ErrorSignInSignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ErrorSignInSignInState(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedError,
    ));
  }
}

// dart format on
