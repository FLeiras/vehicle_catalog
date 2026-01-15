import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';

abstract class VehicleRepository {
  Future<List<Vehicle>> getVehicles();
}
