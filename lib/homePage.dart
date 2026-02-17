import 'package:flutter/material.dart';
import 'routepage.dart'; // Import RoutePage here
import 'favorite_route_page.dart'; // Import FavoriteRoutePage here
import 'about_page.dart'; // Import AboutPage here
import 'bus_schedule_page.dart'; // Import BusSchedulePage here
import 'loginpage.dart'; // Import LoginPage here

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEHU BUS'),
        backgroundColor: Colors.blue[700], // NEHU themed color
      ),
      // Adding the Drawer here with profile name and ID
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer header with profile info (name and ID)
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700], // NEHU themed color
              ),
              child: Row(
                children: [
                  // Profile picture on the left
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      'JD', // Replace with user's initials
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Space between picture and info
                  // Name and ID on the right
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'John Doe', // Replace with actual name
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'ID: 123456', // Replace with actual ID
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // List of navigation items
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Bus Map'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.route),
              title: const Text('Route'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoutePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite Routes'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteRoutePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Bus Schedule'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusSchedulePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            // Settings and Logout buttons
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle Settings tap here
                print("Settings tapped");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
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
            _buildButton(
              context,
              Icons.map,
              'Bus Map',
                  () {
                // Handle Bus Map tap
                print("Bus Map tapped");
              },
            ),
            _buildButton(
              context,
              Icons.route,
              'Route',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoutePage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.location_on,
              'Live Track',
                  () {
                // Handle Live Track tap
                print("Live Track tapped");
              },
            ),
            _buildButton(
              context,
              Icons.favorite,
              'Favorite Routes',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteRoutePage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.schedule,
              'Bus Schedule',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusSchedulePage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.info,
              'About',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[700]!, Colors.blue[500]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 50),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
