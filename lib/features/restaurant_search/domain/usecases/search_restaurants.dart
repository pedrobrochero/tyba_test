import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';
import '../entities/log.dart';
import '../entities/restaurant.dart';
import '../repositories/logger_repository.dart';
import '../repositories/search_restaurants_repository.dart';

class SearchRestaurants extends UseCase<List<Restaurant>, String> {
  SearchRestaurants(this._repository, this._loggerRepository);
  final SearchRestaurantsRepository _repository;
  final LoggerRepository _loggerRepository;

  /// This method takes as param the name of a city to retrieve restaurants close to it
  @override
  Future<Either<Failure, List<Restaurant>>> call(String params) async {
    await _loggerRepository.createLog(
        Log(createdAt: DateTime.now(), content: 'Search for: $params'));
    return _repository.getRestaurants(params);
  }
}
