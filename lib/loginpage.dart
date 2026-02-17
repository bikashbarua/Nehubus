import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage here
import 'signuppage.dart'; // Import SignupPage here

void main() {
  runApp(const MyApp()); // Call MyApp as the entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: 'NEHU Bus App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Set LoginPage as the home widget
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen height using MediaQuery for responsive design
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      resizeToAvoidBottomInset: true, // Ensure layout adjusts when keyboard appears
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height, // Ensure full screen height is used
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Student Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo.png', // Replace with your logo path
                  height: height * 0.2, // Adjust height according to screen size
                ),
                const SizedBox(height: 10),
                const Text(
                  'NEHU BUS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue[700],
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to the SignupPage when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
