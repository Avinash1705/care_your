

import 'package:care_your/feature/foodScanner/data/datasource/food_remote_datasource.dart';
import 'package:care_your/feature/foodScanner/domain/entities/food.dart';
import 'package:care_your/feature/foodScanner/domain/repository/food_repository.dart';

class FoodRepositoryImpl extends FoodRepository{
  final FoodRemoteDataSource remoteDataSource;
  FoodRepositoryImpl(this.remoteDataSource);

  @override
  Future<Food> scanFood(String imagePath) async {
    return await remoteDataSource.scanFood(imagePath);
  }
}