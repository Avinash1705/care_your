import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/image_picker_service.dart';
import '../../../../injection_container.dart';
import '../bloc/food_bloc.dart';
import '../bloc/food_state.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  Future<void> scanFood(BuildContext context) async {

    final imagePicker = getIt<ImagePickerService>();

    final imagePath = await imagePicker.pickFromCamera();

    if (imagePath != null) {
      context.read<FoodBloc>().add(
        ScanFoodEvent(imagePath),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("AI Food Scanner")),

      body: Center(
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {

            if (state is FoodLoading) {
              return const CircularProgressIndicator();
            }

            if (state is FoodLoaded) {
              return Text(
                "${state.food.name} - ${state.food.calories} kcal",
              );
            }

            return ElevatedButton(
              onPressed: () => scanFood(context),
              child: const Text("Scan Food"),
            );
          },
        ),
      ),
    );
  }
}