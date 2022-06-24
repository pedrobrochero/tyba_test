part of 'restaurants_search_cubit.dart';

@freezed
class RestaurantsSearchState with _$RestaurantsSearchState {
  const factory RestaurantsSearchState({
    @Default(Status.initial()) status,
    @Default([]) List<Restaurant> restaurants,
    @Default('') String query,
  }) = _Initial;
}
