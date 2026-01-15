import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';

class VehicleModel extends Vehicle {
  VehicleModel({
    required super.id,
    required super.brand,
    required super.model,
    required super.year,
    required super.price,
    required super.color,
    required super.transmission,
    required super.mileage,
    required super.imageUrl,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      price: (json['price'] as num).toDouble(),
      color: json['color'],
      transmission: json['transmission'],
      mileage: json['mileage'],
      imageUrl: json['imageUrl'],
    );
  }
}
