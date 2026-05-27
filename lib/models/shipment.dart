class Shipment {
  final String id;
  final String origin;
  final String destination;
  final String status;
  final double weight;
  final DateTime departureDate;
  final DateTime estimatedArrival;

  Shipment({
    required this.id,
    required this.origin,
    required this.destination,
    required this.status,
    required this.weight,
    required this.departureDate,
    required this.estimatedArrival,
  });
}
