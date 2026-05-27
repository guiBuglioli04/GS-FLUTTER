import 'package:flutter/material.dart';

class ShipmentCard extends StatelessWidget {
  final String id;
  final String origin;
  final String destination;
  final String status;
  final double weight;
  final DateTime estimatedArrival;
  final VoidCallback onTap;

  const ShipmentCard({
    Key? key,
    required this.id,
    required this.origin,
    required this.destination,
    required this.status,
    required this.weight,
    required this.estimatedArrival,
    required this.onTap,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (status) {
      case 'Entregue':
        return Colors.green;
      case 'Em Trânsito':
        return Colors.blue;
      case 'Pendente':
        return Colors.orange;
      case 'Cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          Icons.local_shipping,
          color: _getStatusColor(),
          size: 32,
        ),
        title: Text(
          '$origin → $destination',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: $id | Peso: ${weight}kg'),
            Text(
              status,
              style: TextStyle(
                color: _getStatusColor(),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
