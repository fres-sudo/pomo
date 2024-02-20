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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  String? get imageCover => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  List<User>? get contributors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DateTime dueDate,
      User owner,
      String? imageCover,
      List<Task>? tasks,
      List<User>? contributors});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? dueDate = null,
    Object? owner = null,
    Object? imageCover = freezed,
    Object? tasks = freezed,
    Object? contributors = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
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
      {String id,
      String name,
      String description,
      DateTime dueDate,
      User owner,
      String? imageCover,
      List<Task>? tasks,
      List<User>? contributors});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? dueDate = null,
    Object? owner = null,
    Object? imageCover = freezed,
    Object? tasks = freezed,
    Object? contributors = freezed,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
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
      {required this.id,
      required this.name,
      required this.description,
      required this.dueDate,
      required this.owner,
      this.imageCover,
      final List<Task>? tasks,
      final List<User>? contributors})
      : _tasks = tasks,
        _contributors = contributors,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime dueDate;
  @override
  final User owner;
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
    return 'Project(id: $id, name: $name, description: $description, dueDate: $dueDate, owner: $owner, imageCover: $imageCover, tasks: $tasks, contributors: $contributors)';
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
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.owner, owner) || other.owner == owner) &&
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
      dueDate,
      owner,
      imageCover,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_contributors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);
}

abstract class _Project extends Project {
  const factory _Project(
      {required final String id,
      required final String name,
      required final String description,
      required final DateTime dueDate,
      required final User owner,
      final String? imageCover,
      final List<Task>? tasks,
      final List<User>? contributors}) = _$ProjectImpl;
  const _Project._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get dueDate;
  @override
  User get owner;
  @override
  String? get imageCover;
  @override
  List<Task>? get tasks;
  @override
  List<User>? get contributors;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
