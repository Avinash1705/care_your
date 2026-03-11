import '../../domain/entities/food.dart';

abstract class FoodRepository {
  Future<Food> scanFood(String imagePath);
}