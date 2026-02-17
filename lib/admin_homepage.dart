import 'package:flutter/material.dart';
import 'admin_login.dart';
import 'add_driver.dart';
import 'add_bus_admin.dart';
import 'add_route_admin.dart';
import 'modify_route_admin.dart'; // Correct import for ModifyDeleteRoutePage
import 'delete_driver_admin.dart'; // Import the Delete Driver page

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      'AD',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Admin Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'ID: A123456',
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
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                print("Settings tapped");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminLoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1,
          children: <Widget>[
            _buildButton(
              context,
              Icons.person_add,
              'Add Driver',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddDriverPage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.person,
              'Delete Driver',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeleteDriverAdminPage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.directions_bus,
              'Add Bus',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBusAdminPage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.bus_alert,
              'Modify/Delete Bus',
                  () {
                print("Modify/Delete Bus tapped");
              },
            ),
            _buildButton(
              context,
              Icons.add_road,
              'Add Route',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddRouteAdminPage()),
                );
              },
            ),
            _buildButton(
              context,
              Icons.edit_road,
              'Modify/Delete Route',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModifyDeleteRoutePage()),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
