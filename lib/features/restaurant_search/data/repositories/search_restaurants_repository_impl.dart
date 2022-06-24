import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../domain/entities/restaurant.dart';
import '../../domain/repositories/search_restaurants_repository.dart';
import '../data_sources/search_restaurants_remote_data_source.dart';

class SearchRestaurantsRepositoryImpl implements SearchRestaurantsRepository {
  SearchRestaurantsRepositoryImpl(this._remoteDataSource);

  final SearchRestaurantsRemoteDataSource _remoteDataSource;
  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurants(String query) async {
    try {
      final restaurants = await _remoteDataSource.getRestaurants(query);
      return Right(restaurants);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
