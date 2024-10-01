// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Project {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get imageCover => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  List<User>? get contributors => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      DateTime? createdAt,
      DateTime startDate,
      DateTime endDate,
      DateTime? completedAt,
      String userId,
      String? imageCover,
      List<Task>? tasks,
      List<User>? contributors});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? completedAt = freezed,
    Object? userId = null,
    Object? imageCover = freezed,
    Object? tasks = freezed,
    Object? contributors = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageCover: freezed == imageCover
          ? _value.imageCover
          : imageCover // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      contributors: freezed == contributors
          ? _value.contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      DateTime? createdAt,
      DateTime startDate,
      DateTime endDate,
      DateTime? completedAt,
      String userId,
      String? imageCover,
      List<Task>? tasks,
      List<User>? contributors});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? completedAt = freezed,
    Object? userId = null,
    Object? imageCover = freezed,
    Object? tasks = freezed,
    Object? contributors = freezed,
  }) {
    return _then(_$ProjectImpl(
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageCover: freezed == imageCover
          ? _value.imageCover
          : imageCover // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      contributors: freezed == contributors
          ? _value._contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc

class _$ProjectImpl extends _Project {
  const _$ProjectImpl(
      {this.id,
      required this.name,
      this.description,
      this.createdAt,
      required this.startDate,
      required this.endDate,
      this.completedAt,
      required this.userId,
      this.imageCover,
      final List<Task>? tasks,
      final List<User>? contributors})
      : _tasks = tasks,
        _contributors = contributors,
        super._();

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime? completedAt;
  @override
  final String userId;
  @override
  final String? imageCover;
  final List<Task>? _tasks;
  @override
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _contributors;
  @override
  List<User>? get contributors {
    final value = _contributors;
    if (value == null) return null;
    if (_contributors is EqualUnmodifiableListView) return _contributors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Project(id: $id, name: $name, description: $description, createdAt: $createdAt, startDate: $startDate, endDate: $endDate, completedAt: $completedAt, userId: $userId, imageCover: $imageCover, tasks: $tasks, contributors: $contributors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageCover, imageCover) ||
                other.imageCover == imageCover) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._contributors, _contributors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      createdAt,
      startDate,
      endDate,
      completedAt,
      userId,
      imageCover,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_contributors));

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);
}

abstract class _Project extends Project {
  const factory _Project(
      {final String? id,
      required final String name,
      final String? description,
      final DateTime? createdAt,
      required final DateTime startDate,
      required final DateTime endDate,
      final DateTime? completedAt,
      required final String userId,
      final String? imageCover,
      final List<Task>? tasks,
      final List<User>? contributors}) = _$ProjectImpl;
  const _Project._() : super._();

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DateTime? get completedAt;
  @override
  String get userId;
  @override
  String? get imageCover;
  @override
  List<Task>? get tasks;
  @override
  List<User>? get contributors;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
