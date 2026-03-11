import 'package:care_your/feature/foodScanner/domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel({
    required super.name,
    required super.calories,
    required super.protein,
    required super.carbs,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['food'],
      calories: json['calories'],
      protein: json['protein'],
      carbs: json['carbs'],
    );
  }
}
