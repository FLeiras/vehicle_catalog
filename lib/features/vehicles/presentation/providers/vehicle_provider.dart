import 'package:flutter/material.dart';

import '../../domain/usecases/get_vehicles.dart';
import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';

class VehicleProvider extends ChangeNotifier {
  final GetVehicles getVehicles;

  VehicleProvider(this.getVehicles);

  bool loading = false;
  String? error;
  List<Vehicle> vehicles = [];

  Future<void> loadVehicles() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      vehicles = await getVehicles();
    } catch (_) {
      error = 'Error cargando vehículos';
    }

    loading = false;
    notifyListeners();
  }
}
