// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get pomodoro => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Project? get referenceProject => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String name,
      int pomodoro,
      bool completed,
      User user,
      Project? referenceProject});

  $UserCopyWith<$Res> get user;
  $ProjectCopyWith<$Res>? get referenceProject;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pomodoro = null,
    Object? completed = null,
    Object? user = null,
    Object? referenceProject = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pomodoro: null == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      referenceProject: freezed == referenceProject
          ? _value.referenceProject
          : referenceProject // ignore: cast_nullable_to_non_nullable
              as Project?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get referenceProject {
    if (_value.referenceProject == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.referenceProject!, (value) {
      return _then(_value.copyWith(referenceProject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int pomodoro,
      bool completed,
      User user,
      Project? referenceProject});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $ProjectCopyWith<$Res>? get referenceProject;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pomodoro = null,
    Object? completed = null,
    Object? user = null,
    Object? referenceProject = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pomodoro: null == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      referenceProject: freezed == referenceProject
          ? _value.referenceProject
          : referenceProject // ignore: cast_nullable_to_non_nullable
              as Project?,
    ));
  }
}

/// @nodoc

class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {required this.id,
      required this.name,
      required this.pomodoro,
      required this.completed,
      required this.user,
      this.referenceProject})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final int pomodoro;
  @override
  final bool completed;
  @override
  final User user;
  @override
  final Project? referenceProject;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, pomodoro: $pomodoro, completed: $completed, user: $user, referenceProject: $referenceProject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pomodoro, pomodoro) ||
                other.pomodoro == pomodoro) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.referenceProject, referenceProject) ||
                other.referenceProject == referenceProject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, pomodoro, completed, user, referenceProject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task extends Task {
  const factory _Task(
      {required final String id,
      required final String name,
      required final int pomodoro,
      required final bool completed,
      required final User user,
      final Project? referenceProject}) = _$TaskImpl;
  const _Task._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  int get pomodoro;
  @override
  bool get completed;
  @override
  User get user;
  @override
  Project? get referenceProject;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
