import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  void _exchangePoints() {
    final String temp = _startController.text;
    _startController.text = _endController.text;
    _endController.text = temp;
  }

  void _searchRoute() {
    String startPoint = _startController.text;
    String endPoint = _endController.text;

    // Here you can add actual route searching logic
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Route Search"),
        content: Text("Searching route from $startPoint to $endPoint"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Start Point TextField
            TextField(
              controller: _startController,
              decoration: InputDecoration(
                labelText: 'Start Point',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.start),
              ),
            ),
            const SizedBox(height: 10),

            // Rotated exchange button between Start and End Points
            Transform.rotate(
              angle: 3.14 / 2, // Rotating by 90 degrees (π/2 radians)
              child: ElevatedButton(
                onPressed: _exchangePoints,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.swap_horiz, // Exchange icon
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // End Point TextField
            TextField(
              controller: _endController,
              decoration: InputDecoration(
                labelText: 'End Point',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.stop),
              ),
            ),
            const SizedBox(height: 20),

            // Button to search for the route
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _searchRoute,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue[700],
                ),
                child: const Text(
                  'Search Route',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Button to go back to the home page
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
