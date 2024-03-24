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
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get pomodoro => throw _privateConstructorUsedError;
  int? get pomodoroCompleted => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String? get referenceProject => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      int pomodoro,
      int? pomodoroCompleted,
      bool completed,
      String user,
      String? referenceProject,
      DateTime createdAt,
      DateTime? completedAt});
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
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? pomodoro = null,
    Object? pomodoroCompleted = freezed,
    Object? completed = null,
    Object? user = null,
    Object? referenceProject = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pomodoro: null == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoroCompleted: freezed == pomodoroCompleted
          ? _value.pomodoroCompleted
          : pomodoroCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      referenceProject: freezed == referenceProject
          ? _value.referenceProject
          : referenceProject // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
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
      {String? id,
      String name,
      String? description,
      int pomodoro,
      int? pomodoroCompleted,
      bool completed,
      String user,
      String? referenceProject,
      DateTime createdAt,
      DateTime? completedAt});
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
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? pomodoro = null,
    Object? pomodoroCompleted = freezed,
    Object? completed = null,
    Object? user = null,
    Object? referenceProject = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pomodoro: null == pomodoro
          ? _value.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoroCompleted: freezed == pomodoroCompleted
          ? _value.pomodoroCompleted
          : pomodoroCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      referenceProject: freezed == referenceProject
          ? _value.referenceProject
          : referenceProject // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {this.id,
      required this.name,
      this.description,
      required this.pomodoro,
      this.pomodoroCompleted,
      required this.completed,
      required this.user,
      this.referenceProject,
      required this.createdAt,
      this.completedAt})
      : super._();

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int pomodoro;
  @override
  final int? pomodoroCompleted;
  @override
  final bool completed;
  @override
  final String user;
  @override
  final String? referenceProject;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, pomodoro: $pomodoro, pomodoroCompleted: $pomodoroCompleted, completed: $completed, user: $user, referenceProject: $referenceProject, createdAt: $createdAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pomodoro, pomodoro) ||
                other.pomodoro == pomodoro) &&
            (identical(other.pomodoroCompleted, pomodoroCompleted) ||
                other.pomodoroCompleted == pomodoroCompleted) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.referenceProject, referenceProject) ||
                other.referenceProject == referenceProject) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      pomodoro,
      pomodoroCompleted,
      completed,
      user,
      referenceProject,
      createdAt,
      completedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task extends Task {
  const factory _Task(
      {final String? id,
      required final String name,
      final String? description,
      required final int pomodoro,
      final int? pomodoroCompleted,
      required final bool completed,
      required final String user,
      final String? referenceProject,
      required final DateTime createdAt,
      final DateTime? completedAt}) = _$TaskImpl;
  const _Task._() : super._();

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  int get pomodoro;
  @override
  int? get pomodoroCompleted;
  @override
  bool get completed;
  @override
  String get user;
  @override
  String? get referenceProject;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
