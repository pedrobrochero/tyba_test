import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/status.dart';
import '../../domain/entities/restaurant.dart';
import '../../domain/usecases/search_restaurants.dart';

part 'restaurants_search_cubit.freezed.dart';
part 'restaurants_search_state.dart';

class RestaurantsSearchCubit extends Cubit<RestaurantsSearchState> {
  RestaurantsSearchCubit(this._searchRestaurantsUsecase)
      : super(const RestaurantsSearchState());

  final SearchRestaurants _searchRestaurantsUsecase;

  void updateQueryTerm(String value) {
    emit(state.copyWith(query: value));
  }

  void search() async {
    emit(state.copyWith(status: const Status.loading()));
    final restaurantsEither = await _searchRestaurantsUsecase.call(state.query);
    restaurantsEither.fold(
      (l) => emit(state.copyWith(status: const Status.error())),
      (r) => emit(state.copyWith(
        status: const Status.loaded(),
        restaurants: r,
      )),
    );
  }

  void clearSearch() {
    emit(state.copyWith(
      status: const Status.initial(),
      restaurants: [],
    ));
  }
}
