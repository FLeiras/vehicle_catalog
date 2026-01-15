import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/vehicles/data/datasources/vehicle_local_datasource.dart';
import 'features/vehicles/data/repositories/vehicle_repository_impl.dart';
import 'features/vehicles/domain/usecases/get_vehicles.dart';
import 'features/vehicles/presentation/providers/vehicle_provider.dart';
import 'features/vehicles/presentation/pages/vehicle_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final datasource = VehicleLocalDataSource();
            final repository = VehicleRepositoryImpl(datasource);
            final getVehicles = GetVehicles(repository);

            return VehicleProvider(getVehicles);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vehicle Catalog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const VehicleListPage(),
      ),
    );
  }
}
