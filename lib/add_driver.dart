import 'package:flutter/material.dart';

class AddDriverPage extends StatefulWidget {
  const AddDriverPage({super.key});

  @override
  _AddDriverPageState createState() => _AddDriverPageState();
}

class _AddDriverPageState extends State<AddDriverPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  void _createDriverAccount() {
    if (_formKey.currentState!.validate()) {
      // Handle account creation logic here
      // For demonstration purposes, we will just print the values
      print("Driver Name: ${_nameController.text}");
      print("Driver ID: ${_idController.text}");
      print("Driver Email: ${_emailController.text}");
      print("Driver Password: ${_passwordController.text}");
      print("Driver Mobile: ${_mobileController.text}");

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Driver account created successfully!')),
      );

      // Clear the input fields after submission
      _nameController.clear();
      _idController.clear();
      _emailController.clear();
      _passwordController.clear();
      _mobileController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Driver'),
        backgroundColor: Colors.blue[700], // NEHU themed color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Driver Name TextField
              _buildTextField(
                controller: _nameController,
                label: 'Driver Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the driver\'s name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Driver ID TextField
              _buildTextField(
                controller: _idController,
                label: 'Driver ID',
                icon: Icons.card_membership,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the driver\'s ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Driver Email TextField
              _buildTextField(
                controller: _emailController,
                label: 'Driver Email',
                icon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the driver\'s email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Driver Password TextField
              _buildTextField(
                controller: _passwordController,
                label: 'Driver Password',
                icon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the driver\'s password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Driver Mobile Number TextField
              _buildTextField(
                controller: _mobileController,
                label: 'Driver Mobile Number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the driver\'s mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Create Driver Account Button
              ElevatedButton(
                onPressed: _createDriverAccount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // NEHU themed color
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Create Driver Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
        // Added padding to prevent text from being cut off
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0), // Increased vertical padding
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 16), // Increased font size for better visibility
    );
  }
}
