import 'dart:convert';

import 'package:care_your/core/Constants/ApiConstants.dart';
import 'package:http/http.dart' as http;

import '../models/food_model.dart';

class FoodRemoteDataSource {
  final http.Client client;

  FoodRemoteDataSource(this.client);

  Future<FoodModel> scanFood(String imagePath) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiConstants.scanFood),
    );

    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    var response = await request.send();
    var json = jsonDecode(await response.stream.bytesToString());

    return FoodModel.fromJson(json);
  }
}
