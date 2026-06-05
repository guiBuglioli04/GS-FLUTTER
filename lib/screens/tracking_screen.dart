import 'package:flutter/material.dart';
import '../data/mockTrackingData.dart';
class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedShipment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rastreamento'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            _selectedShipment == null
                ? _buildEmptyState()
                : _buildTrackingInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Digite o ID do envio (ex: SHP001)',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() => _selectedShipment = null);
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
      ),
      onChanged: (value) {
        setState(() {});
      },
      onSubmitted: (value) {
        if (mockTrackingData.containsKey(value.toUpperCase())) {
          setState(() => _selectedShipment = value.toUpperCase());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Envio não encontrado')),
          );
        }
      },
    );
  }

  Widget _buildEmptyState() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 80,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'Digite um ID de envio para rastrear',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Exemplos: SHP001, SHP002, SHP003',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingInfo() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.deepPurple.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ID: $_selectedShipment',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Icon(
                          Icons.local_shipping,
                          color: Colors.deepPurple,
                          size: 32,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      mockTrackingData[_selectedShipment] ??
                          'Informação não disponível',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Histórico de Localização',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildLocationTimeline(),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                setState(() => _selectedShipment = null);
                _searchController.clear();
              },
              icon: const Icon(Icons.clear),
              label: const Text('Limpar Busca'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationTimeline() {
    return Column(
      children: [
        _buildLocationItem('Terra', 'Origem', true),
        const SizedBox(height: 8),
        _buildLocationItem('Lua', 'Passagem', false),
        const SizedBox(height: 8),
        _buildLocationItem('Marte', 'Destino', false),
      ],
    );
  }

  Widget _buildLocationItem(String location, String type, bool active) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: active ? Colors.deepPurple : Colors.grey.shade300,
          width: active ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: active ? Colors.deepPurple.withOpacity(0.05) : null,
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: active ? Colors.deepPurple : Colors.grey,
            size: 28,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                type,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
