import 'package:flutter/material.dart';
import 'loginpage.dart'; // Import the LoginPage for student login
import 'admin_login.dart'; // Import the AdminLoginPage for admin login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEHU Bus App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginOptionsPage(),
    );
  }
}

class LoginOptionsPage extends StatefulWidget {
  const LoginOptionsPage({super.key});

  @override
  State<LoginOptionsPage> createState() => _LoginOptionsPageState();
}

class _LoginOptionsPageState extends State<LoginOptionsPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildLogo(),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Welcome to NEHU Bus App',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                _buildLoginButton(
                  'Login As Student',
                  Icons.school,
                      () {
                    _handleLogin(context, const LoginPage()); // Link to the LoginPage for student login
                  },
                ),
                const SizedBox(height: 20),
                _buildLoginButton(
                  'Login As Admin',
                  Icons.admin_panel_settings,
                      () {
                    _handleLogin(context, const AdminLoginPage()); // Link to AdminLoginPage for admin login
                  },
                ),
              ],
            ),
          ),
          if (isLoading)
            _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      color: Colors.white,
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Hero(
        tag: 'logo',
        child: Image.asset(
          'assets/icon/logo.png',
          height: 120,
        ),
      ),
    );
  }

  Widget _buildLoginButton(String label, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0097B2),
            const Color(0xFF7ED957),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        icon: Icon(icon, size: 28, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 5,
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context, Widget page) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulating an async task

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

    setState(() {
      isLoading = false;
    });
  }
}
