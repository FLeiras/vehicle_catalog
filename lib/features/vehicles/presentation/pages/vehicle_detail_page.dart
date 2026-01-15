import 'package:flutter/material.dart';
import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';

class VehicleDetailPage extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailPage({super.key, required this.vehicle});
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
    return Scaffold(
      appBar: AppBar(title: Text('${vehicle.brand} ${vehicle.model}')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 16),
                  _buildInfoRow('Year', vehicle.year.toString()),
                  _buildInfoRow('Price', '\$${vehicle.price}'),
                  _buildInfoRow('Color', vehicle.color),
                  _buildInfoRow('Transmission', vehicle.transmission),
                  _buildInfoRow('Mileage', '${vehicle.mileage} km'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.network(
        vehicle.imageUrl,
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: AlignmentGeometry.center,
        errorBuilder: (_, _, _) {
          return Image.asset(
            _localImageById(vehicle.id),
            width: 260,
            alignment: AlignmentGeometry.center,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      '${vehicle.brand} ${vehicle.model}',
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}
