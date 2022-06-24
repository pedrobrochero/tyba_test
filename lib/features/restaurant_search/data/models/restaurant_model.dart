import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/restaurant.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required String name,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  factory RestaurantModel.fromEntity(Restaurant entity) => RestaurantModel(
        name: entity.name,
      );

  const RestaurantModel._();

  Restaurant get entity => Restaurant(
        name: name,
      );
}
