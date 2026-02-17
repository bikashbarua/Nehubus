import 'package:flutter/material.dart';

class BusSchedulePage extends StatefulWidget {
  const BusSchedulePage({super.key});

  @override
  _BusSchedulePageState createState() => _BusSchedulePageState();
}

class _BusSchedulePageState extends State<BusSchedulePage> {
  final List<BusService> _busServices = [
    BusService(route: 'From Mawiong Rim', busNumber: 'ML-OS-F-266', time: '8:15 AM'),
    BusService(route: 'From 7th Mile IA Garikhana', busNumber: 'ML-05-F-2267', time: '8:15 AM'),
    BusService(route: 'From 3rd Mile IA Garikhana', busNumber: 'ML-OS-C-5405', time: '8:15 AM'),
    BusService(route: 'From Fire-Brigade via Polo', busNumber: 'ML-OS-F-2263', time: '8:15 AM'),
    BusService(route: 'From Nongthiy AI via Golflinks', busNumber: 'L-OS-K-4863', time: '8:15 AM'),
    BusService(route: 'From Rynjai via Golflinks', busNumber: 'ML-OS-0-6598', time: '8:15 AM'),
    BusService(route: 'From Tattumkhrai via Golflinks', busNumber: 'MI-0S-C-8714', time: '8:15 AM'),
    BusService(route: 'From Laitumkhrai via Polo', busNumber: 'MI-OS-C-89R2', time: '8:15 AM'),
    BusService(route: 'From Nongthymmai via Golflinks', busNumber: 'ML-0S-K-1862', time: '8:15 AM'),
    // Up Services
    BusService(route: 'To Garikhana', busNumber: 'ML-0S-B-2266', time: '3:30 PM'),
    BusService(route: 'To Raj-Bhavan Point via Sanker, Polo', busNumber: 'ML-05-F-2267', time: '3:30 PM'),
    BusService(route: 'To Garikhana', busNumber: 'ML-05-C-5405', time: '3:30 PM'),
    BusService(route: 'To Raj-Bhavan Point', busNumber: 'ML-OS-F-2263', time: '3:30 PM'),
    BusService(route: 'To Laitumkhrai via Polo', busNumber: 'ML-05-F-2267', time: '5:15 PM'),
    BusService(route: 'To Nongthiymai', busNumber: 'MI-OS-C-8713', time: '5:15 PM'),
    BusService(route: 'To Garikhana', busNumber: 'M-OS-0-6898', time: '5:15 PM'),
    BusService(route: 'To 7th Mile via Garikhana', busNumber: 'ML-05-C-8714', time: '5:15 PM'),
    BusService(route: 'To Laran via Garikhana', busNumber: 'ML-0S-C-89?', time: '5:15 PM'),
    BusService(route: 'To Laitumkhrai via Polo', busNumber: 'ML-OS-K-4863', time: '6:15 PM'),
    BusService(route: 'To Nongthiymai via Polo', busNumber: 'ML-05-K-4862', time: '6:15 PM'),
  ];

  List<BusService> _filteredBusServices = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Initially display all bus services
    _filteredBusServices = _busServices;
  }

  void _filterBusServices(String query) {
    setState(() {
      _searchQuery = query.toLowerCase(); // Convert to lowercase for case-insensitive search
      _filteredBusServices = _busServices.where((busService) {
        return busService.busNumber.toLowerCase().contains(_searchQuery) ||
            busService.route.toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
        backgroundColor: Colors.blue[700], // NEHU themed color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Section
              const SizedBox(height: 20), // Added top margin before search
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search by Bus Number or Name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _filterBusServices(_searchQuery);
                    },
                  ),
                ),
                onChanged: (value) {
                  _filterBusServices(value);
                },
              ),
              const SizedBox(height: 20),

              // Down Service Section
              const Text(
                'NEHU Campus (Down Service)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ..._buildBusServiceTiles(),
              const SizedBox(height: 20),

              // Additional Information
              const Text(
                'Note: Schedule is subject to change. Please verify timings before your journey.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBusServiceTiles() {
    if (_filteredBusServices.isEmpty) {
      return [
        const Center(child: Text('No bus services found for this query.')),
      ];
    }
    return _filteredBusServices.map((busService) {
      return _buildBusServiceTile(busService.route, busService.busNumber, busService.time);
    }).toList();
  }

  Widget _buildBusServiceTile(String route, String busNumber, String time) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: const Icon(Icons.directions_bus, size: 40, color: Colors.blue), // Bus icon
        title: Text(route, style: const TextStyle(fontSize: 18)),
        subtitle: Text('Bus Number: $busNumber\nTime: $time', style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

class BusService {
  final String route;
  final String busNumber;
  final String time;

  BusService({required this.route, required this.busNumber, required this.time});
}
