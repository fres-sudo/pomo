// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {
  String? get id;
  String get name;
  String? get description;
  int get pomodoro;
  int? get pomodoroCompleted;
  String get userId;
  String? get projectId;
  DateTime get dueDate;
  DateTime get createdAt;
  DateTime? get updatedAt;
  bool get highPriority;
  DateTime? get completedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskCopyWith<Task> get copyWith =>
      _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pomodoro, pomodoro) ||
                other.pomodoro == pomodoro) &&
            (identical(other.pomodoroCompleted, pomodoroCompleted) ||
                other.pomodoroCompleted == pomodoroCompleted) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.highPriority, highPriority) ||
                other.highPriority == highPriority) &&
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
      userId,
      projectId,
      dueDate,
      createdAt,
      updatedAt,
      highPriority,
      completedAt);

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, pomodoro: $pomodoro, pomodoroCompleted: $pomodoroCompleted, userId: $userId, projectId: $projectId, dueDate: $dueDate, createdAt: $createdAt, updatedAt: $updatedAt, highPriority: $highPriority, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) =
      _$TaskCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      int pomodoro,
      int? pomodoroCompleted,
      String userId,
      String? projectId,
      DateTime dueDate,
      DateTime createdAt,
      DateTime? updatedAt,
      bool highPriority,
      DateTime? completedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? pomodoro = null,
    Object? pomodoroCompleted = freezed,
    Object? userId = null,
    Object? projectId = freezed,
    Object? dueDate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? highPriority = null,
    Object? completedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pomodoro: null == pomodoro
          ? _self.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoroCompleted: freezed == pomodoroCompleted
          ? _self.pomodoroCompleted
          : pomodoroCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      highPriority: null == highPriority
          ? _self.highPriority
          : highPriority // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _Task extends Task {
  const _Task(
      {this.id,
      required this.name,
      this.description,
      required this.pomodoro,
      this.pomodoroCompleted,
      required this.userId,
      this.projectId,
      required this.dueDate,
      required this.createdAt,
      this.updatedAt,
      required this.highPriority,
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
  final String userId;
  @override
  final String? projectId;
  @override
  final DateTime dueDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool highPriority;
  @override
  final DateTime? completedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pomodoro, pomodoro) ||
                other.pomodoro == pomodoro) &&
            (identical(other.pomodoroCompleted, pomodoroCompleted) ||
                other.pomodoroCompleted == pomodoroCompleted) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.highPriority, highPriority) ||
                other.highPriority == highPriority) &&
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
      userId,
      projectId,
      dueDate,
      createdAt,
      updatedAt,
      highPriority,
      completedAt);

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, pomodoro: $pomodoro, pomodoroCompleted: $pomodoroCompleted, userId: $userId, projectId: $projectId, dueDate: $dueDate, createdAt: $createdAt, updatedAt: $updatedAt, highPriority: $highPriority, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) =
      __$TaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      int pomodoro,
      int? pomodoroCompleted,
      String userId,
      String? projectId,
      DateTime dueDate,
      DateTime createdAt,
      DateTime? updatedAt,
      bool highPriority,
      DateTime? completedAt});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? pomodoro = null,
    Object? pomodoroCompleted = freezed,
    Object? userId = null,
    Object? projectId = freezed,
    Object? dueDate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? highPriority = null,
    Object? completedAt = freezed,
  }) {
    return _then(_Task(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pomodoro: null == pomodoro
          ? _self.pomodoro
          : pomodoro // ignore: cast_nullable_to_non_nullable
              as int,
      pomodoroCompleted: freezed == pomodoroCompleted
          ? _self.pomodoroCompleted
          : pomodoroCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      highPriority: null == highPriority
          ? _self.highPriority
          : highPriority // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
