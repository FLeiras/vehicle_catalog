import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_catalog/features/vehicles/data/models/vehicle_model.dart';

void main() {
  test('VehicleModel parses json correctly', () {
    final json = {
      "id": 1,
      "brand": "Toyota",
      "model": "Corolla",
      "year": 2022,
      "price": 21500,
      "color": "Blanco",
      "transmission": "Automática",
      "mileage": 12000,
      "imageUrl": "url",
    };

    final vehicle = VehicleModel.fromJson(json);

    expect(vehicle.brand, 'Toyota');
    expect(vehicle.price, 21500);
  });
}
