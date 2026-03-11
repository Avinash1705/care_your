part of 'food_bloc.dart';


abstract  class FoodEvent {}

class ScanFoodEvent extends FoodEvent {
  final String imagePath;

  ScanFoodEvent(this.imagePath);
}
