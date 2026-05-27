import 'package:flutter/material.dart';
import '../models/shipment.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  final Shipment shipment;

  const ShipmentDetailsScreen({
    Key? key,
    required this.shipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Envio'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 24),
            _buildInfoSection(
              'Informações Básicas',
              [
                _InfoItem('ID do Envio', shipment.id),
                _InfoItem('Peso', '${shipment.weight} kg'),
              ],
            ),
            const SizedBox(height: 24),
            _buildRouteSection(),
            const SizedBox(height: 24),
            _buildInfoSection(
              'Datas',
              [
                _InfoItem(
                  'Data de Partida',
                  _formatDate(shipment.departureDate),
                ),
                _InfoItem(
                  'Chegada Estimada',
                  _formatDate(shipment.estimatedArrival),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTimeline(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    Color statusColor = Colors.grey;
    String statusEmoji = '📦';

    switch (shipment.status) {
      case 'Entregue':
        statusColor = Colors.green;
        statusEmoji = '✅';
        break;
      case 'Em Trânsito':
        statusColor = Colors.blue;
        statusEmoji = '🚀';
        break;
      case 'Pendente':
        statusColor = Colors.orange;
        statusEmoji = '⏳';
        break;
      case 'Cancelado':
        statusColor = Colors.red;
        statusEmoji = '❌';
        break;
    }

    return Card(
      color: statusColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: statusColor, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              statusEmoji,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 12),
            Text(
              shipment.status,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rota de Envio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.deepPurple,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shipment.origin,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 32,
                    ),
                    const SizedBox(height: 8),
                    const Text('→'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shipment.destination,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<_InfoItem> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.label,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        item.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Histórico',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildTimelineItem(
              'Preparação',
              'Envio sendo preparado',
              true,
            ),
            _buildTimelineItem(
              'Despacho',
              'Enviado da origem',
              shipment.status != 'Pendente',
            ),
            _buildTimelineItem(
              'Em Rota',
              'Em trânsito',
              shipment.status == 'Em Trânsito' ||
                  shipment.status == 'Entregue',
            ),
            _buildTimelineItem(
              'Entregue',
              'Chegou no destino',
              shipment.status == 'Entregue',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String title, String subtitle, bool completed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  completed ? Colors.deepPurple : Colors.grey.shade300,
            ),
            child: Icon(
              completed ? Icons.check : Icons.circle,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class _InfoItem {
  final String label;
  final String value;

  _InfoItem(this.label, this.value);
}
