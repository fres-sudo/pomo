// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [SignInEvent].
extension SignInEventPatterns on SignInEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailSignInEvent value)? email,
    TResult Function(VerifyOtpSignInEvent value)? verifyOtp,
    TResult Function(GoogleSignInEvent value)? google,
    TResult Function(AppleSignInEvent value)? apple,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case EmailSignInEvent() when email != null:
        return email(_that);
      case VerifyOtpSignInEvent() when verifyOtp != null:
        return verifyOtp(_that);
      case GoogleSignInEvent() when google != null:
        return google(_that);
      case AppleSignInEvent() when apple != null:
        return apple(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(EmailSignInEvent value) email,
    required TResult Function(VerifyOtpSignInEvent value) verifyOtp,
    required TResult Function(GoogleSignInEvent value) google,
    required TResult Function(AppleSignInEvent value) apple,
  }) {
    final _that = this;
    switch (_that) {
      case EmailSignInEvent():
        return email(_that);
      case VerifyOtpSignInEvent():
        return verifyOtp(_that);
      case GoogleSignInEvent():
        return google(_that);
      case AppleSignInEvent():
        return apple(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailSignInEvent value)? email,
    TResult? Function(VerifyOtpSignInEvent value)? verifyOtp,
    TResult? Function(GoogleSignInEvent value)? google,
    TResult? Function(AppleSignInEvent value)? apple,
  }) {
    final _that = this;
    switch (_that) {
      case EmailSignInEvent() when email != null:
        return email(_that);
      case VerifyOtpSignInEvent() when verifyOtp != null:
        return verifyOtp(_that);
      case GoogleSignInEvent() when google != null:
        return google(_that);
      case AppleSignInEvent() when apple != null:
        return apple(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? email,
    TResult Function(String email, String otp)? verifyOtp,
    TResult Function()? google,
    TResult Function()? apple,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case EmailSignInEvent() when email != null:
        return email(_that.email);
      case VerifyOtpSignInEvent() when verifyOtp != null:
        return verifyOtp(_that.email, _that.otp);
      case GoogleSignInEvent() when google != null:
        return google();
      case AppleSignInEvent() when apple != null:
        return apple();
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
  TResult when<TResult extends Object?>({
    required TResult Function(String email) email,
    required TResult Function(String email, String otp) verifyOtp,
    required TResult Function() google,
    required TResult Function() apple,
  }) {
    final _that = this;
    switch (_that) {
      case EmailSignInEvent():
        return email(_that.email);
      case VerifyOtpSignInEvent():
        return verifyOtp(_that.email, _that.otp);
      case GoogleSignInEvent():
        return google();
      case AppleSignInEvent():
        return apple();
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? email,
    TResult? Function(String email, String otp)? verifyOtp,
    TResult? Function()? google,
    TResult? Function()? apple,
  }) {
    final _that = this;
    switch (_that) {
      case EmailSignInEvent() when email != null:
        return email(_that.email);
      case VerifyOtpSignInEvent() when verifyOtp != null:
        return verifyOtp(_that.email, _that.otp);
      case GoogleSignInEvent() when google != null:
        return google();
      case AppleSignInEvent() when apple != null:
        return apple();
      case _:
        return null;
    }
  }
}

/// @nodoc

class EmailSignInEvent implements SignInEvent {
  const EmailSignInEvent({required this.email});

  final String email;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmailSignInEventCopyWith<EmailSignInEvent> get copyWith =>
      _$EmailSignInEventCopyWithImpl<EmailSignInEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailSignInEvent &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'SignInEvent.email(email: $email)';
  }
}

/// @nodoc
abstract mixin class $EmailSignInEventCopyWith<$Res>
    implements $SignInEventCopyWith<$Res> {
  factory $EmailSignInEventCopyWith(
          EmailSignInEvent value, $Res Function(EmailSignInEvent) _then) =
      _$EmailSignInEventCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailSignInEventCopyWithImpl<$Res>
    implements $EmailSignInEventCopyWith<$Res> {
  _$EmailSignInEventCopyWithImpl(this._self, this._then);

  final EmailSignInEvent _self;
  final $Res Function(EmailSignInEvent) _then;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(EmailSignInEvent(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class VerifyOtpSignInEvent implements SignInEvent {
  const VerifyOtpSignInEvent({required this.email, required this.otp});

  final String email;
  final String otp;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyOtpSignInEventCopyWith<VerifyOtpSignInEvent> get copyWith =>
      _$VerifyOtpSignInEventCopyWithImpl<VerifyOtpSignInEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyOtpSignInEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  @override
  String toString() {
    return 'SignInEvent.verifyOtp(email: $email, otp: $otp)';
  }
}

/// @nodoc
abstract mixin class $VerifyOtpSignInEventCopyWith<$Res>
    implements $SignInEventCopyWith<$Res> {
  factory $VerifyOtpSignInEventCopyWith(VerifyOtpSignInEvent value,
          $Res Function(VerifyOtpSignInEvent) _then) =
      _$VerifyOtpSignInEventCopyWithImpl;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class _$VerifyOtpSignInEventCopyWithImpl<$Res>
    implements $VerifyOtpSignInEventCopyWith<$Res> {
  _$VerifyOtpSignInEventCopyWithImpl(this._self, this._then);

  final VerifyOtpSignInEvent _self;
  final $Res Function(VerifyOtpSignInEvent) _then;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(VerifyOtpSignInEvent(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSignedInSignInState value)? notSignedIn,
    TResult Function(SigningInSignInState value)? signingIn,
    TResult Function(SignedInSignInState value)? signedIn,
    TResult Function(VerifyingEmailSignInState value)? verifyingEmail,
    TResult Function(VerificationSuccessfulSignInState value)?
        verificationSuccessful,
    TResult Function(VerificationFailedSignInState value)? verificationError,
    TResult Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult Function(ErrorSignInSignInState value)? errorSignIn,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotSignedInSignInState() when notSignedIn != null:
        return notSignedIn(_that);
      case SigningInSignInState() when signingIn != null:
        return signingIn(_that);
      case SignedInSignInState() when signedIn != null:
        return signedIn(_that);
      case VerifyingEmailSignInState() when verifyingEmail != null:
        return verifyingEmail(_that);
      case VerificationSuccessfulSignInState()
          when verificationSuccessful != null:
        return verificationSuccessful(_that);
      case VerificationFailedSignInState() when verificationError != null:
        return verificationError(_that);
      case SignedInWithGoogleSignInState() when signedInWithGoogle != null:
        return signedInWithGoogle(_that);
      case SignedInWithAppleSignInState() when signedInWithApple != null:
        return signedInWithApple(_that);
      case ErrorSignInSignInState() when errorSignIn != null:
        return errorSignIn(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(NotSignedInSignInState value) notSignedIn,
    required TResult Function(SigningInSignInState value) signingIn,
    required TResult Function(SignedInSignInState value) signedIn,
    required TResult Function(VerifyingEmailSignInState value) verifyingEmail,
    required TResult Function(VerificationSuccessfulSignInState value)
        verificationSuccessful,
    required TResult Function(VerificationFailedSignInState value)
        verificationError,
    required TResult Function(SignedInWithGoogleSignInState value)
        signedInWithGoogle,
    required TResult Function(SignedInWithAppleSignInState value)
        signedInWithApple,
    required TResult Function(ErrorSignInSignInState value) errorSignIn,
  }) {
    final _that = this;
    switch (_that) {
      case NotSignedInSignInState():
        return notSignedIn(_that);
      case SigningInSignInState():
        return signingIn(_that);
      case SignedInSignInState():
        return signedIn(_that);
      case VerifyingEmailSignInState():
        return verifyingEmail(_that);
      case VerificationSuccessfulSignInState():
        return verificationSuccessful(_that);
      case VerificationFailedSignInState():
        return verificationError(_that);
      case SignedInWithGoogleSignInState():
        return signedInWithGoogle(_that);
      case SignedInWithAppleSignInState():
        return signedInWithApple(_that);
      case ErrorSignInSignInState():
        return errorSignIn(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotSignedInSignInState value)? notSignedIn,
    TResult? Function(SigningInSignInState value)? signingIn,
    TResult? Function(SignedInSignInState value)? signedIn,
    TResult? Function(VerifyingEmailSignInState value)? verifyingEmail,
    TResult? Function(VerificationSuccessfulSignInState value)?
        verificationSuccessful,
    TResult? Function(VerificationFailedSignInState value)? verificationError,
    TResult? Function(SignedInWithGoogleSignInState value)? signedInWithGoogle,
    TResult? Function(SignedInWithAppleSignInState value)? signedInWithApple,
    TResult? Function(ErrorSignInSignInState value)? errorSignIn,
  }) {
    final _that = this;
    switch (_that) {
      case NotSignedInSignInState() when notSignedIn != null:
        return notSignedIn(_that);
      case SigningInSignInState() when signingIn != null:
        return signingIn(_that);
      case SignedInSignInState() when signedIn != null:
        return signedIn(_that);
      case VerifyingEmailSignInState() when verifyingEmail != null:
        return verifyingEmail(_that);
      case VerificationSuccessfulSignInState()
          when verificationSuccessful != null:
        return verificationSuccessful(_that);
      case VerificationFailedSignInState() when verificationError != null:
        return verificationError(_that);
      case SignedInWithGoogleSignInState() when signedInWithGoogle != null:
        return signedInWithGoogle(_that);
      case SignedInWithAppleSignInState() when signedInWithApple != null:
        return signedInWithApple(_that);
      case ErrorSignInSignInState() when errorSignIn != null:
        return errorSignIn(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSignedIn,
    TResult Function()? signingIn,
    TResult Function(String email)? signedIn,
    TResult Function()? verifyingEmail,
    TResult Function()? verificationSuccessful,
    TResult Function(LocalizedError error)? verificationError,
    TResult Function(User user)? signedInWithGoogle,
    TResult Function(User user)? signedInWithApple,
    TResult Function(LocalizedError error)? errorSignIn,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotSignedInSignInState() when notSignedIn != null:
        return notSignedIn();
      case SigningInSignInState() when signingIn != null:
        return signingIn();
      case SignedInSignInState() when signedIn != null:
        return signedIn(_that.email);
      case VerifyingEmailSignInState() when verifyingEmail != null:
        return verifyingEmail();
      case VerificationSuccessfulSignInState()
          when verificationSuccessful != null:
        return verificationSuccessful();
      case VerificationFailedSignInState() when verificationError != null:
        return verificationError(_that.error);
      case SignedInWithGoogleSignInState() when signedInWithGoogle != null:
        return signedInWithGoogle(_that.user);
      case SignedInWithAppleSignInState() when signedInWithApple != null:
        return signedInWithApple(_that.user);
      case ErrorSignInSignInState() when errorSignIn != null:
        return errorSignIn(_that.error);
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
  TResult when<TResult extends Object?>({
    required TResult Function() notSignedIn,
    required TResult Function() signingIn,
    required TResult Function(String email) signedIn,
    required TResult Function() verifyingEmail,
    required TResult Function() verificationSuccessful,
    required TResult Function(LocalizedError error) verificationError,
    required TResult Function(User user) signedInWithGoogle,
    required TResult Function(User user) signedInWithApple,
    required TResult Function(LocalizedError error) errorSignIn,
  }) {
    final _that = this;
    switch (_that) {
      case NotSignedInSignInState():
        return notSignedIn();
      case SigningInSignInState():
        return signingIn();
      case SignedInSignInState():
        return signedIn(_that.email);
      case VerifyingEmailSignInState():
        return verifyingEmail();
      case VerificationSuccessfulSignInState():
        return verificationSuccessful();
      case VerificationFailedSignInState():
        return verificationError(_that.error);
      case SignedInWithGoogleSignInState():
        return signedInWithGoogle(_that.user);
      case SignedInWithAppleSignInState():
        return signedInWithApple(_that.user);
      case ErrorSignInSignInState():
        return errorSignIn(_that.error);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notSignedIn,
    TResult? Function()? signingIn,
    TResult? Function(String email)? signedIn,
    TResult? Function()? verifyingEmail,
    TResult? Function()? verificationSuccessful,
    TResult? Function(LocalizedError error)? verificationError,
    TResult? Function(User user)? signedInWithGoogle,
    TResult? Function(User user)? signedInWithApple,
    TResult? Function(LocalizedError error)? errorSignIn,
  }) {
    final _that = this;
    switch (_that) {
      case NotSignedInSignInState() when notSignedIn != null:
        return notSignedIn();
      case SigningInSignInState() when signingIn != null:
        return signingIn();
      case SignedInSignInState() when signedIn != null:
        return signedIn(_that.email);
      case VerifyingEmailSignInState() when verifyingEmail != null:
        return verifyingEmail();
      case VerificationSuccessfulSignInState()
          when verificationSuccessful != null:
        return verificationSuccessful();
      case VerificationFailedSignInState() when verificationError != null:
        return verificationError(_that.error);
      case SignedInWithGoogleSignInState() when signedInWithGoogle != null:
        return signedInWithGoogle(_that.user);
      case SignedInWithAppleSignInState() when signedInWithApple != null:
        return signedInWithApple(_that.user);
      case ErrorSignInSignInState() when errorSignIn != null:
        return errorSignIn(_that.error);
      case _:
        return null;
    }
  }
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
  const SignedInSignInState(this.email);

  final String email;

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
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'SignInState.signedIn(email: $email)';
  }
}

/// @nodoc
abstract mixin class $SignedInSignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $SignedInSignInStateCopyWith(
          SignedInSignInState value, $Res Function(SignedInSignInState) _then) =
      _$SignedInSignInStateCopyWithImpl;
  @useResult
  $Res call({String email});
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
    Object? email = null,
  }) {
    return _then(SignedInSignInState(
      null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class VerifyingEmailSignInState implements SignInState {
  const VerifyingEmailSignInState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyingEmailSignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.verifyingEmail()';
  }
}

/// @nodoc

class VerificationSuccessfulSignInState implements SignInState {
  const VerificationSuccessfulSignInState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationSuccessfulSignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.verificationSuccessful()';
  }
}

/// @nodoc

class VerificationFailedSignInState implements SignInState {
  const VerificationFailedSignInState(this.error);

  final LocalizedError error;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerificationFailedSignInStateCopyWith<VerificationFailedSignInState>
      get copyWith => _$VerificationFailedSignInStateCopyWithImpl<
          VerificationFailedSignInState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationFailedSignInState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SignInState.verificationError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $VerificationFailedSignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $VerificationFailedSignInStateCopyWith(
          VerificationFailedSignInState value,
          $Res Function(VerificationFailedSignInState) _then) =
      _$VerificationFailedSignInStateCopyWithImpl;
  @useResult
  $Res call({LocalizedError error});
}

/// @nodoc
class _$VerificationFailedSignInStateCopyWithImpl<$Res>
    implements $VerificationFailedSignInStateCopyWith<$Res> {
  _$VerificationFailedSignInStateCopyWithImpl(this._self, this._then);

  final VerificationFailedSignInState _self;
  final $Res Function(VerificationFailedSignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(VerificationFailedSignInState(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedError,
    ));
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
