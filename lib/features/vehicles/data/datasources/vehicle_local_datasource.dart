import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/vehicle_model.dart';

class VehicleLocalDataSource {
  Future<List<VehicleModel>> getVehicles() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final jsonString = await rootBundle.loadString('assets/vehicles.json');
    final List data = json.decode(jsonString);

    return data.map((e) => VehicleModel.fromJson(e)).toList();
  }
}
