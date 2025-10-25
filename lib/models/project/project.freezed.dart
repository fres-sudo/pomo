// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {
  String? get id;
  String get name;
  String? get description;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  DateTime get startDate;
  DateTime get endDate;
  DateTime? get completedAt;
  String get userId;
  String? get imageCover;
  List<Task>? get tasks;
  List<User>? get contributors;
  ProjectStatus get status;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<Project> get copyWith =>
      _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Project &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageCover, imageCover) ||
                other.imageCover == imageCover) &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality()
                .equals(other.contributors, contributors) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      createdAt,
      updatedAt,
      startDate,
      endDate,
      completedAt,
      userId,
      imageCover,
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(contributors),
      status);

  @override
  String toString() {
    return 'Project(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, completedAt: $completedAt, userId: $userId, imageCover: $imageCover, tasks: $tasks, contributors: $contributors, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) =
      _$ProjectCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime startDate,
      DateTime endDate,
      DateTime? completedAt,
      String userId,
      String? imageCover,
      List<Task>? tasks,
      List<User>? contributors,
      ProjectStatus status});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? completedAt = freezed,
    Object? userId = null,
    Object? imageCover = freezed,
    Object? tasks = freezed,
    Object? contributors = freezed,
    Object? status = null,
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
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageCover: freezed == imageCover
          ? _self.imageCover
          : imageCover // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: freezed == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      contributors: freezed == contributors
          ? _self.contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
    ));
  }
}

/// Adds pattern-matching-related methods to [Project].
extension ProjectPatterns on Project {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Project value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_Project value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Project value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? id,
            String name,
            String? description,
            DateTime? createdAt,
            DateTime? updatedAt,
            DateTime startDate,
            DateTime endDate,
            DateTime? completedAt,
            String userId,
            String? imageCover,
            List<Task>? tasks,
            List<User>? contributors,
            ProjectStatus status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.createdAt,
            _that.updatedAt,
            _that.startDate,
            _that.endDate,
            _that.completedAt,
            _that.userId,
            _that.imageCover,
            _that.tasks,
            _that.contributors,
            _that.status);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            String? id,
            String name,
            String? description,
            DateTime? createdAt,
            DateTime? updatedAt,
            DateTime startDate,
            DateTime endDate,
            DateTime? completedAt,
            String userId,
            String? imageCover,
            List<Task>? tasks,
            List<User>? contributors,
            ProjectStatus status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.createdAt,
            _that.updatedAt,
            _that.startDate,
            _that.endDate,
            _that.completedAt,
            _that.userId,
            _that.imageCover,
            _that.tasks,
            _that.contributors,
            _that.status);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? id,
            String name,
            String? description,
            DateTime? createdAt,
            DateTime? updatedAt,
            DateTime startDate,
            DateTime endDate,
            DateTime? completedAt,
            String userId,
            String? imageCover,
            List<Task>? tasks,
            List<User>? contributors,
            ProjectStatus status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Project() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.createdAt,
            _that.updatedAt,
            _that.startDate,
            _that.endDate,
            _that.completedAt,
            _that.userId,
            _that.imageCover,
            _that.tasks,
            _that.contributors,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Project extends Project {
  const _Project(
      {this.id,
      required this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      required this.startDate,
      required this.endDate,
      this.completedAt,
      required this.userId,
      this.imageCover,
      final List<Task>? tasks,
      final List<User>? contributors,
      required this.status})
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
  final DateTime? updatedAt;
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
  final ProjectStatus status;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
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
                .equals(other._contributors, _contributors) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      createdAt,
      updatedAt,
      startDate,
      endDate,
      completedAt,
      userId,
      imageCover,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_contributors),
      status);

  @override
  String toString() {
    return 'Project(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, completedAt: $completedAt, userId: $userId, imageCover: $imageCover, tasks: $tasks, contributors: $contributors, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) =
      __$ProjectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime startDate,
      DateTime endDate,
      DateTime? completedAt,
      String userId,
      String? imageCover,
      List<Task>? tasks,
      List<User>? contributors,
      ProjectStatus status});
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? completedAt = freezed,
    Object? userId = null,
    Object? imageCover = freezed,
    Object? tasks = freezed,
    Object? contributors = freezed,
    Object? status = null,
  }) {
    return _then(_Project(
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
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageCover: freezed == imageCover
          ? _self.imageCover
          : imageCover // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: freezed == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      contributors: freezed == contributors
          ? _self._contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
    ));
  }
}

// dart format on
