// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurants_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestaurantsSearchState {
  dynamic get status => throw _privateConstructorUsedError;
  List<Restaurant> get restaurants => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestaurantsSearchStateCopyWith<RestaurantsSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantsSearchStateCopyWith<$Res> {
  factory $RestaurantsSearchStateCopyWith(RestaurantsSearchState value,
          $Res Function(RestaurantsSearchState) then) =
      _$RestaurantsSearchStateCopyWithImpl<$Res>;
  $Res call({dynamic status, List<Restaurant> restaurants, String query});
}

/// @nodoc
class _$RestaurantsSearchStateCopyWithImpl<$Res>
    implements $RestaurantsSearchStateCopyWith<$Res> {
  _$RestaurantsSearchStateCopyWithImpl(this._value, this._then);

  final RestaurantsSearchState _value;
  // ignore: unused_field
  final $Res Function(RestaurantsSearchState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? restaurants = freezed,
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      restaurants: restaurants == freezed
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RestaurantsSearchStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({dynamic status, List<Restaurant> restaurants, String query});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RestaurantsSearchStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? status = freezed,
    Object? restaurants = freezed,
    Object? query = freezed,
  }) {
    return _then(_$_Initial(
      status: status == freezed ? _value.status : status,
      restaurants: restaurants == freezed
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = const Status.initial(),
      final List<Restaurant> restaurants = const [],
      this.query = ''})
      : _restaurants = restaurants;

  @override
  @JsonKey()
  final dynamic status;
  final List<Restaurant> _restaurants;
  @override
  @JsonKey()
  List<Restaurant> get restaurants {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'RestaurantsSearchState(status: $status, restaurants: $restaurants, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants) &&
            const DeepCollectionEquality().equals(other.query, query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_restaurants),
      const DeepCollectionEquality().hash(query));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements RestaurantsSearchState {
  const factory _Initial(
      {final dynamic status,
      final List<Restaurant> restaurants,
      final String query}) = _$_Initial;

  @override
  dynamic get status => throw _privateConstructorUsedError;
  @override
  List<Restaurant> get restaurants => throw _privateConstructorUsedError;
  @override
  String get query => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
