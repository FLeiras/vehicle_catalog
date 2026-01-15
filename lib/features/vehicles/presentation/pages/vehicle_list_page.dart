import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/vehicle_card.dart';
import '../providers/vehicle_provider.dart';
import 'package:vehicle_catalog/features/vehicles/presentation/pages/vehicle_detail_page.dart';
import 'package:vehicle_catalog/features/vehicles/domain/entities/vehicles.dart';

class VehicleListPage extends StatefulWidget {
  const VehicleListPage({super.key});

  @override
  State<VehicleListPage> createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  String _query = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<VehicleProvider>().loadVehicles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VehicleProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Vehicle Catalog')),
      body: Column(
        children: [
          _buildSearch(),
          Expanded(child: _buildContent(provider)),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search by brand or model',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            _query = value.toLowerCase();
          });
        },
      ),
    );
  }

  Widget _buildContent(VehicleProvider provider) {
    if (provider.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return _buildError(provider);
    }

    final vehicles = _filteredVehicles(provider.vehicles);

    if (vehicles.isEmpty) {
      return const Center(child: Text('No vehicles found'));
    }

    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (_, index) {
        final vehicle = vehicles[index];
        return VehicleCard(vehicle: vehicle, onTap: () => _openDetail(vehicle));
      },
    );
  }

  Widget _buildError(VehicleProvider provider) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(provider.error!, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: provider.loadVehicles,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  List<Vehicle> _filteredVehicles(List<Vehicle> vehicles) {
    if (_query.isEmpty) return vehicles;

    return vehicles.where((vehicle) {
      return vehicle.brand.toLowerCase().contains(_query) ||
          vehicle.model.toLowerCase().contains(_query);
    }).toList();
  }

  void _openDetail(Vehicle vehicle) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => VehicleDetailPage(vehicle: vehicle)),
    );
  }
}
