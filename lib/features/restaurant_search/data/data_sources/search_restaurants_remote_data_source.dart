import 'package:dio/dio.dart';

import '../../../../core/misc/mixins/http_helpers.dart';
import '../../domain/entities/restaurant.dart';
import '../models/restaurant_model.dart';

abstract class SearchRestaurantsRemoteDataSource {
  Future<List<Restaurant>> getRestaurants(String query);
}

class SearchRestaurantsRemoteDataSourceImpl
    with HttpHelpers
    implements SearchRestaurantsRemoteDataSource {
  // TODO find a proper public API and cofigure it
  final _server = Dio(BaseOptions(
    baseUrl: 'baseUrl',
    receiveTimeout: 15000,
  ));

  @override
  Future<List<Restaurant>> getRestaurants(String query) async {
    final result = await _server.get(
      '/restaurants/:$query',
    );
    final List data = result.data;
    return getList(data, (json) => RestaurantModel.fromJson(json).entity);
  }
}

class DummySearchRestaurantsRemoteDataSourceImpl
    implements SearchRestaurantsRemoteDataSource {
  @override
  Future<List<Restaurant>> getRestaurants(String query) async => [
        _dummyRestaurant,
        _dummyRestaurant,
        _dummyRestaurant,
        _dummyRestaurant,
        _dummyRestaurant,
      ];

  Restaurant get _dummyRestaurant => const Restaurant(
        name: 'Restaurant name',
      );
}
