import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/service/image_picker_service.dart';
import 'feature/foodScanner/data/datasource/food_remote_datasource.dart';
import 'feature/foodScanner/data/repository_impl/food_repository_impl.dart';
import 'feature/foodScanner/domain/repository/food_repository.dart';
import 'feature/foodScanner/domain/usecases/scan_food.dart';
import 'feature/foodScanner/presentation/bloc/food_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  /// BLOC
  getIt.registerFactory(
        () => FoodBloc(getIt()),
  );

  /// USE CASE
  getIt.registerLazySingleton(
        () => ScanFood(getIt()),
  );

  /// REPOSITORY
  getIt.registerLazySingleton<FoodRepository>(
        () => FoodRepositoryImpl(getIt()),
  );

  /// DATASOURCE
  getIt.registerLazySingleton(
        () => FoodRemoteDataSource(getIt()),
  );

  /// SERVICES
  getIt.registerLazySingleton(
        () => ImagePickerService(),
  );

  /// HTTP CLIENT
  getIt.registerLazySingleton(
        () => http.Client(),
  );
}