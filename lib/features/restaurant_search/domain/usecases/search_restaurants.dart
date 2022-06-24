import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/restaurant.dart';
import '../repositories/search_restaurants_repository.dart';

class SearchRestaurants extends UseCase<List<Restaurant>, String> {
  SearchRestaurants(this._repository);
  final SearchRestaurantsRepository _repository;

  /// This method takes as param the name of a city to retrieve restaurants close to it
  @override
  Future<Either<Failure, List<Restaurant>>> call(String params) =>
      _repository.getRestaurants(params);
}
