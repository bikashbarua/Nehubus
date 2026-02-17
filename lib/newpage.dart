import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEHU Bus Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEHU BUS'),
        backgroundColor: Colors.blue[700], // NEHU themed color
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Add your image asset path
                  ),
                  const SizedBox(width: 16), // Add spacing between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Mohammad Saqib', // Replace with dynamic name if needed
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'ID: 12345678', // Replace with dynamic ID if needed
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Add settings action here
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Add about action here
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Two buttons per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1, // Make buttons square
          children: <Widget>[
            // Button for Bus Map
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.map, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('Bus Map', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Button for Route
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.route, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('Route', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Button for Live Track
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('Live Track', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Button for Favorite Routes
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.favorite, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('Favorite Routes', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Button for Settings
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.settings, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('Settings', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Button for About
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.info, color: Colors.white, size: 40),
                    SizedBox(height: 10),
                    Text('About', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
