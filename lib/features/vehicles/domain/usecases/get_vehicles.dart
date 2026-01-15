import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';
import 'package:vehicle_catalog/features/vehicles/domain/repositories/vehicle_repository.dart';

class GetVehicles {
  final VehicleRepository repository;

  GetVehicles(this.repository);

  Future<List<Vehicle>> call() {
    return repository.getVehicles();
  }
}
