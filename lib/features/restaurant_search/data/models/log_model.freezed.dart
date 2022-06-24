// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogModel _$LogModelFromJson(Map<String, dynamic> json) {
  return _LogModel.fromJson(json);
}

/// @nodoc
mixin _$LogModel {
  @JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogModelCopyWith<LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogModelCopyWith<$Res> {
  factory $LogModelCopyWith(LogModel value, $Res Function(LogModel) then) =
      _$LogModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
          DateTime createdAt,
      String content});
}

/// @nodoc
class _$LogModelCopyWithImpl<$Res> implements $LogModelCopyWith<$Res> {
  _$LogModelCopyWithImpl(this._value, this._then);

  final LogModel _value;
  // ignore: unused_field
  final $Res Function(LogModel) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LogModelCopyWith<$Res> implements $LogModelCopyWith<$Res> {
  factory _$$_LogModelCopyWith(
          _$_LogModel value, $Res Function(_$_LogModel) then) =
      __$$_LogModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
          DateTime createdAt,
      String content});
}

/// @nodoc
class __$$_LogModelCopyWithImpl<$Res> extends _$LogModelCopyWithImpl<$Res>
    implements _$$_LogModelCopyWith<$Res> {
  __$$_LogModelCopyWithImpl(
      _$_LogModel _value, $Res Function(_$_LogModel) _then)
      : super(_value, (v) => _then(v as _$_LogModel));

  @override
  _$_LogModel get _value => super._value as _$_LogModel;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_LogModel(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogModel extends _LogModel {
  const _$_LogModel(
      {@JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
          required this.createdAt,
      required this.content})
      : super._();

  factory _$_LogModel.fromJson(Map<String, dynamic> json) =>
      _$$_LogModelFromJson(json);

  @override
  @JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
  final DateTime createdAt;
  @override
  final String content;

  @override
  String toString() {
    return 'LogModel(createdAt: $createdAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogModel &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_LogModelCopyWith<_$_LogModel> get copyWith =>
      __$$_LogModelCopyWithImpl<_$_LogModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogModelToJson(this);
  }
}

abstract class _LogModel extends LogModel {
  const factory _LogModel(
      {@JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
          required final DateTime createdAt,
      required final String content}) = _$_LogModel;
  const _LogModel._() : super._();

  factory _LogModel.fromJson(Map<String, dynamic> json) = _$_LogModel.fromJson;

  @override
  @JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LogModelCopyWith<_$_LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}
