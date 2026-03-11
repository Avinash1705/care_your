
import 'dart:async';

import 'package:care_your/feature/foodScanner/domain/entities/food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/scan_food.dart';
import 'food_state.dart';

part 'food_event.dart';


class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final ScanFood scanFood;
  FoodBloc(this.scanFood) : super(FoodInitial()) {
    on<ScanFoodEvent>(_onScanFoodEvent);
  }

  Future<void> _onScanFoodEvent(ScanFoodEvent event, Emitter<FoodState> emit) async {
    emit(FoodLoading());
    try{
      final food = ScanFoodEvent(event.imagePath);
      emit(FoodLoaded(food as Food));
    }
    catch(e){
      emit(FoodError("Failed to scan food"));
    }
  }
}
