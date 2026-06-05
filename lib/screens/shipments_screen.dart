import 'package:flutter/material.dart';
import '../models/shipment.dart';
import '../widgets/shipment_card.dart';
import '../data/mockShipment.dart';

class ShipmentsScreen extends StatefulWidget {
  const ShipmentsScreen({Key? key}) : super(key: key);

  @override
  State<ShipmentsScreen> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<ShipmentsScreen> {
  late List<Shipment> _shipments;
  late List<Shipment> _filteredShipments;
  String _selectedFilter = 'Todos';

  @override
  void initState() {
    super.initState();
    _shipments = ShipmentService.getMockedShipments();
    _filteredShipments = _shipments;
  }

  void _filterShipments(String status) {
    setState(() {
      _selectedFilter = status;
      if (status == 'Todos') {
        _filteredShipments = _shipments;
      } else {
        _filteredShipments =
            _shipments.where((s) => s.status == status).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Envios'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('Todos'),
                  _buildFilterChip('Em Trânsito'),
                  _buildFilterChip('Entregue'),
                  _buildFilterChip('Pendente'),
                  _buildFilterChip('Cancelado'),
                ],
              ),
            ),
          ),
          Expanded(
            child: _filteredShipments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Nenhum envio encontrado',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredShipments.length,
                    itemBuilder: (context, index) {
                      final shipment = _filteredShipments[index];
                      return ShipmentCard(
                        id: shipment.id,
                        origin: shipment.origin,
                        destination: shipment.destination,
                        status: shipment.status,
                        weight: shipment.weight,
                        estimatedArrival: shipment.estimatedArrival,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/shipment-details',
                            arguments: shipment,
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => _filterShipments(label),
        backgroundColor: Colors.white,
        selectedColor: Colors.white,
        side: BorderSide(
          color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
        ),
        labelStyle: TextStyle(
          color: isSelected ? Colors.deepPurple : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
