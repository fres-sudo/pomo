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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() perform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? perform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? perform,
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
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PerformSignUpEventImplCopyWith<$Res> {
  factory _$$PerformSignUpEventImplCopyWith(_$PerformSignUpEventImpl value,
          $Res Function(_$PerformSignUpEventImpl) then) =
      __$$PerformSignUpEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformSignUpEventImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$PerformSignUpEventImpl>
    implements _$$PerformSignUpEventImplCopyWith<$Res> {
  __$$PerformSignUpEventImplCopyWithImpl(_$PerformSignUpEventImpl _value,
      $Res Function(_$PerformSignUpEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformSignUpEventImpl implements PerformSignUpEvent {
  const _$PerformSignUpEventImpl();

  @override
  String toString() {
    return 'SignUpEvent.perform()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PerformSignUpEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() perform,
  }) {
    return perform();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? perform,
  }) {
    return perform?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? perform,
    required TResult orElse(),
  }) {
    if (perform != null) {
      return perform();
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
  const factory PerformSignUpEvent() = _$PerformSignUpEventImpl;
}

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() performing,
    required TResult Function() performed,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? performing,
    TResult? Function()? performed,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? performing,
    TResult Function()? performed,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformingSignUpState value) performing,
    required TResult Function(PerformedSignUpState value) performed,
    required TResult Function(ErrorSignUpState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformingSignUpState value)? performing,
    TResult? Function(PerformedSignUpState value)? performed,
    TResult? Function(ErrorSignUpState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformingSignUpState value)? performing,
    TResult Function(PerformedSignUpState value)? performed,
    TResult Function(ErrorSignUpState value)? error,
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
}

/// @nodoc
abstract class _$$PerformingSignUpStateImplCopyWith<$Res> {
  factory _$$PerformingSignUpStateImplCopyWith(
          _$PerformingSignUpStateImpl value,
          $Res Function(_$PerformingSignUpStateImpl) then) =
      __$$PerformingSignUpStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformingSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$PerformingSignUpStateImpl>
    implements _$$PerformingSignUpStateImplCopyWith<$Res> {
  __$$PerformingSignUpStateImplCopyWithImpl(_$PerformingSignUpStateImpl _value,
      $Res Function(_$PerformingSignUpStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformingSignUpStateImpl implements PerformingSignUpState {
  const _$PerformingSignUpStateImpl();

  @override
  String toString() {
    return 'SignUpState.performing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformingSignUpStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() performing,
    required TResult Function() performed,
    required TResult Function() error,
  }) {
    return performing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? performing,
    TResult? Function()? performed,
    TResult? Function()? error,
  }) {
    return performing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? performing,
    TResult Function()? performed,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (performing != null) {
      return performing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformingSignUpState value) performing,
    required TResult Function(PerformedSignUpState value) performed,
    required TResult Function(ErrorSignUpState value) error,
  }) {
    return performing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformingSignUpState value)? performing,
    TResult? Function(PerformedSignUpState value)? performed,
    TResult? Function(ErrorSignUpState value)? error,
  }) {
    return performing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformingSignUpState value)? performing,
    TResult Function(PerformedSignUpState value)? performed,
    TResult Function(ErrorSignUpState value)? error,
    required TResult orElse(),
  }) {
    if (performing != null) {
      return performing(this);
    }
    return orElse();
  }
}

abstract class PerformingSignUpState implements SignUpState {
  const factory PerformingSignUpState() = _$PerformingSignUpStateImpl;
}

/// @nodoc
abstract class _$$PerformedSignUpStateImplCopyWith<$Res> {
  factory _$$PerformedSignUpStateImplCopyWith(_$PerformedSignUpStateImpl value,
          $Res Function(_$PerformedSignUpStateImpl) then) =
      __$$PerformedSignUpStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformedSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$PerformedSignUpStateImpl>
    implements _$$PerformedSignUpStateImplCopyWith<$Res> {
  __$$PerformedSignUpStateImplCopyWithImpl(_$PerformedSignUpStateImpl _value,
      $Res Function(_$PerformedSignUpStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformedSignUpStateImpl implements PerformedSignUpState {
  const _$PerformedSignUpStateImpl();

  @override
  String toString() {
    return 'SignUpState.performed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformedSignUpStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() performing,
    required TResult Function() performed,
    required TResult Function() error,
  }) {
    return performed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? performing,
    TResult? Function()? performed,
    TResult? Function()? error,
  }) {
    return performed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? performing,
    TResult Function()? performed,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (performed != null) {
      return performed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformingSignUpState value) performing,
    required TResult Function(PerformedSignUpState value) performed,
    required TResult Function(ErrorSignUpState value) error,
  }) {
    return performed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformingSignUpState value)? performing,
    TResult? Function(PerformedSignUpState value)? performed,
    TResult? Function(ErrorSignUpState value)? error,
  }) {
    return performed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformingSignUpState value)? performing,
    TResult Function(PerformedSignUpState value)? performed,
    TResult Function(ErrorSignUpState value)? error,
    required TResult orElse(),
  }) {
    if (performed != null) {
      return performed(this);
    }
    return orElse();
  }
}

abstract class PerformedSignUpState implements SignUpState {
  const factory PerformedSignUpState() = _$PerformedSignUpStateImpl;
}

/// @nodoc
abstract class _$$ErrorSignUpStateImplCopyWith<$Res> {
  factory _$$ErrorSignUpStateImplCopyWith(_$ErrorSignUpStateImpl value,
          $Res Function(_$ErrorSignUpStateImpl) then) =
      __$$ErrorSignUpStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorSignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$ErrorSignUpStateImpl>
    implements _$$ErrorSignUpStateImplCopyWith<$Res> {
  __$$ErrorSignUpStateImplCopyWithImpl(_$ErrorSignUpStateImpl _value,
      $Res Function(_$ErrorSignUpStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorSignUpStateImpl implements ErrorSignUpState {
  const _$ErrorSignUpStateImpl();

  @override
  String toString() {
    return 'SignUpState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorSignUpStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() performing,
    required TResult Function() performed,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? performing,
    TResult? Function()? performed,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? performing,
    TResult Function()? performed,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformingSignUpState value) performing,
    required TResult Function(PerformedSignUpState value) performed,
    required TResult Function(ErrorSignUpState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformingSignUpState value)? performing,
    TResult? Function(PerformedSignUpState value)? performed,
    TResult? Function(ErrorSignUpState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformingSignUpState value)? performing,
    TResult Function(PerformedSignUpState value)? performed,
    TResult Function(ErrorSignUpState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorSignUpState implements SignUpState {
  const factory ErrorSignUpState() = _$ErrorSignUpStateImpl;
}
