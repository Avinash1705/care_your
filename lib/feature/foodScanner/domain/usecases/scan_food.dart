

import '../entities/food.dart';
import '../repository/food_repository.dart';

class ScanFood  {
  final FoodRepository repository;
  ScanFood(this.repository);


  Future<Food> call(String imagePath) async {
    return await repository.scanFood(imagePath);
  }
}