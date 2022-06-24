import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../entities/restaurant.dart';

abstract class SearchRestaurantsRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurants(String query);
}
