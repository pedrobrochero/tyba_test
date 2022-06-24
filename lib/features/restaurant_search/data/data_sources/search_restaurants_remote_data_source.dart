import '../../domain/entities/restaurant.dart';

abstract class SearchRestaurantsRemoteDataSource {
  Future<List<Restaurant>> getRestaurants(String query);
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
