import 'package:vehicle_catalog/features/vehicles/data/datasources/vehicle_local_datasource.dart';
import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';
import 'package:vehicle_catalog/features/vehicles/domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleLocalDataSource datasource;

  VehicleRepositoryImpl(this.datasource);

  @override
  Future<List<Vehicle>> getVehicles() {
    return datasource.getVehicles();
  }
}
