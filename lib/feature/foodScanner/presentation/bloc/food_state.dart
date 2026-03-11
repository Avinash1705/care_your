import '../../domain/entities/food.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final Food food;

  FoodLoaded(this.food);
}

class FoodError extends FoodState {
  final String message;

  FoodError(this.message);
}
