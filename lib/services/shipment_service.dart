import 'package:flutter/material.dart';
import '../models/shipment.dart';

class ShipmentService {
  static List<Shipment> getMockedShipments() {
    return [
      Shipment(
        id: 'SHP001',
        origin: 'Terra',
        destination: 'Marte',
        status: 'Em Trânsito',
        weight: 2500.5,
        departureDate: DateTime.now().subtract(const Duration(days: 5)),
        estimatedArrival: DateTime.now().add(const Duration(days: 45)),
      ),
      Shipment(
        id: 'SHP002',
        origin: 'Lua',
        destination: 'Europa',
        status: 'Entregue',
        weight: 1200.0,
        departureDate: DateTime.now().subtract(const Duration(days: 30)),
        estimatedArrival: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Shipment(
        id: 'SHP003',
        origin: 'Marte',
        destination: 'Terra',
        status: 'Pendente',
        weight: 3100.75,
        departureDate: DateTime.now().add(const Duration(days: 10)),
        estimatedArrival: DateTime.now().add(const Duration(days: 60)),
      ),
      Shipment(
        id: 'SHP004',
        origin: 'Titã',
        destination: 'Lua',
        status: 'Em Trânsito',
        weight: 850.25,
        departureDate: DateTime.now().subtract(const Duration(days: 15)),
        estimatedArrival: DateTime.now().add(const Duration(days: 35)),
      ),
      Shipment(
        id: 'SHP005',
        origin: 'Terra',
        destination: 'Vênus',
        status: 'Cancelado',
        weight: 500.0,
        departureDate: DateTime.now().subtract(const Duration(days: 20)),
        estimatedArrival: DateTime.now(),
      ),
      Shipment(
        id: 'SHP006',
        origin: 'Europa',
        destination: 'Marte',
        status: 'Em Trânsito',
        weight: 2750.5,
        departureDate: DateTime.now().subtract(const Duration(days: 10)),
        estimatedArrival: DateTime.now().add(const Duration(days: 50)),
      ),
    ];
  }
}
