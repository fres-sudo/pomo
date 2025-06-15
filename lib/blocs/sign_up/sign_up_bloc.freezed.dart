// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpEvent {
  String get username;
  String get email;
  String get password;
  String get confirmPassword;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpEventCopyWith<SignUpEvent> get copyWith =>
      _$SignUpEventCopyWithImpl<SignUpEvent>(this as SignUpEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpEvent &&
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

  @override
  String toString() {
    return 'SignUpEvent(username: $username, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }
}

/// @nodoc
abstract mixin class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) _then) =
      _$SignUpEventCopyWithImpl;
  @useResult
  $Res call(
      {String username, String email, String password, String confirmPassword});
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res> implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._self, this._then);

  final SignUpEvent _self;
  final $Res Function(SignUpEvent) _then;

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
    return _then(_self.copyWith(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PerformSignUpEvent implements SignUpEvent {
  const PerformSignUpEvent(
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

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PerformSignUpEventCopyWith<PerformSignUpEvent> get copyWith =>
      _$PerformSignUpEventCopyWithImpl<PerformSignUpEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PerformSignUpEvent &&
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

  @override
  String toString() {
    return 'SignUpEvent.perform(username: $username, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }
}

/// @nodoc
abstract mixin class $PerformSignUpEventCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $PerformSignUpEventCopyWith(
          PerformSignUpEvent value, $Res Function(PerformSignUpEvent) _then) =
      _$PerformSignUpEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String username, String email, String password, String confirmPassword});
}

/// @nodoc
class _$PerformSignUpEventCopyWithImpl<$Res>
    implements $PerformSignUpEventCopyWith<$Res> {
  _$PerformSignUpEventCopyWithImpl(this._self, this._then);

  final PerformSignUpEvent _self;
  final $Res Function(PerformSignUpEvent) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(PerformSignUpEvent(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SignUpState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState()';
  }
}

/// @nodoc
class $SignUpStateCopyWith<$Res> {
  $SignUpStateCopyWith(SignUpState _, $Res Function(SignUpState) __);
}

/// @nodoc

class NotSignedUpSignUpState implements SignUpState {
  const NotSignedUpSignUpState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotSignedUpSignUpState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState.notSignedUp()';
  }
}

/// @nodoc

class SigningUpSignUpState implements SignUpState {
  const SigningUpSignUpState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SigningUpSignUpState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState.signingUp()';
  }
}

/// @nodoc

class SignedUpSignUpState implements SignUpState {
  const SignedUpSignUpState(this.user);

  final User user;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignedUpSignUpStateCopyWith<SignedUpSignUpState> get copyWith =>
      _$SignedUpSignUpStateCopyWithImpl<SignedUpSignUpState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignedUpSignUpState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'SignUpState.signedUp(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SignedUpSignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory $SignedUpSignUpStateCopyWith(
          SignedUpSignUpState value, $Res Function(SignedUpSignUpState) _then) =
      _$SignedUpSignUpStateCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SignedUpSignUpStateCopyWithImpl<$Res>
    implements $SignedUpSignUpStateCopyWith<$Res> {
  _$SignedUpSignUpStateCopyWithImpl(this._self, this._then);

  final SignedUpSignUpState _self;
  final $Res Function(SignedUpSignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(SignedUpSignUpState(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SignUpState
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

class ErrorSignUpSignUpState implements SignUpState {
  const ErrorSignUpSignUpState(this.error);

  final LocalizedError error;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorSignUpSignUpStateCopyWith<ErrorSignUpSignUpState> get copyWith =>
      _$ErrorSignUpSignUpStateCopyWithImpl<ErrorSignUpSignUpState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorSignUpSignUpState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SignUpState.errorSignUp(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorSignUpSignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory $ErrorSignUpSignUpStateCopyWith(ErrorSignUpSignUpState value,
          $Res Function(ErrorSignUpSignUpState) _then) =
      _$ErrorSignUpSignUpStateCopyWithImpl;
  @useResult
  $Res call({LocalizedError error});
}

/// @nodoc
class _$ErrorSignUpSignUpStateCopyWithImpl<$Res>
    implements $ErrorSignUpSignUpStateCopyWith<$Res> {
  _$ErrorSignUpSignUpStateCopyWithImpl(this._self, this._then);

  final ErrorSignUpSignUpState _self;
  final $Res Function(ErrorSignUpSignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ErrorSignUpSignUpState(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedError,
    ));
  }
}

// dart format on
