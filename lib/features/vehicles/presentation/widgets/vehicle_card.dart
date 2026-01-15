import 'package:flutter/material.dart';
import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;

  const VehicleCard({super.key, required this.vehicle, required this.onTap});

  String _localImageById(int id) {
    switch (id) {
      case 1:
        return 'images/corolla.jpg';
      case 2:
        return 'images/focus.jpg';
      default:
        return 'images/corolla.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        vehicle.imageUrl,
        width: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) {
          return Image.asset(
            _localImageById(vehicle.id),
            width: 60,
            fit: BoxFit.cover,
          );
        },
      ),
      title: Text('${vehicle.brand} ${vehicle.model}'),
      subtitle: Text('${vehicle.year} - \$${vehicle.price}'),
      onTap: onTap,
    );
  }
}
