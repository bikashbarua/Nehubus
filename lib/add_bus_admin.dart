import 'package:flutter/material.dart';

class AddBusAdminPage extends StatefulWidget {
  const AddBusAdminPage({super.key});

  @override
  _AddBusAdminPageState createState() => _AddBusAdminPageState();
}

class _AddBusAdminPageState extends State<AddBusAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _busIdController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();

  String? _selectedDirection;

  void _addBus() {
    if (_formKey.currentState!.validate()) {
      // Handle bus addition logic here
      print("Bus ID: ${_busIdController.text}");
      print("Bus Number: ${_busNumberController.text}");
      print("Direction: $_selectedDirection");

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bus added successfully!')),
      );

      // Clear the input fields after submission
      _busIdController.clear();
      _busNumberController.clear();
      setState(() {
        _selectedDirection = null; // Reset selection
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bus'),
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
              // Bus ID TextField
              _buildTextField(
                controller: _busIdController,
                label: 'Bus ID',
                icon: Icons.confirmation_number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bus ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Bus Number TextField
              _buildTextField(
                controller: _busNumberController,
                label: 'Bus Number',
                icon: Icons.directions_bus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bus number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Direction Radio Buttons
              const Text(
                'Select Direction:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('To NEHU Campus'),
                leading: Radio<String>(
                  value: 'to',
                  groupValue: _selectedDirection,
                  onChanged: (value) {
                    setState(() {
                      _selectedDirection = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('From NEHU Campus'),
                leading: Radio<String>(
                  value: 'from',
                  groupValue: _selectedDirection,
                  onChanged: (value) {
                    setState(() {
                      _selectedDirection = value;
                    });
                  },
                ),
              ),

              // Add Bus Button
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _addBus,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // NEHU themed color
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Add Bus'),
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
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      validator: validator,
    );
  }
}
