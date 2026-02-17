import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.blue[700], // NEHU themed color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // About the App
            const Text(
              'About Our Bus App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our bus app aims to provide a seamless experience for users traveling around the NEHU campus. '
                  'With features like real-time bus tracking, route information, and favorite routes, we strive '
                  'to make your commute easier and more efficient. Our app is designed to help you plan your '
                  'journeys effectively and stay updated on bus schedules.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify, // Align the text like a paragraph
            ),
            const SizedBox(height: 20),

            // Developer Information
            const Text(
              'Meet the Developers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Developer List
            _buildDeveloperTile('assets/bikash.jpg', 'Bikash Barua'),
            const SizedBox(height: 10),
            _buildDeveloperTile('assets/images/saqib.jpg', 'Mohammad Saqib'),
            const SizedBox(height: 10),
            _buildDeveloperTile('assets/lidiya.jpg', 'Lidiya Kurbah'),
            const SizedBox(height: 10),
            _buildDeveloperTile('assets/nganthoiba.jpg', 'Nganthoiba Salam'),
            const SizedBox(height: 10),
            _buildDeveloperTile('assets/harbamon.jpg', 'Harbamon Terang'),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperTile(String imagePath, String name) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(width: 16),
        Text(
          name,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
