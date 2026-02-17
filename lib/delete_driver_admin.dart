import 'package:flutter/material.dart';

class DeleteDriverAdminPage extends StatefulWidget {
  const DeleteDriverAdminPage({super.key});

  @override
  _DeleteDriverAdminPageState createState() => _DeleteDriverAdminPageState();
}

class _DeleteDriverAdminPageState extends State<DeleteDriverAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();

  void _deleteDriver() {
    if (_formKey.currentState!.validate()) {
      // Handle the driver deletion logic here
      print("Driver ID to delete: ${_idController.text}");

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Driver account deleted successfully!')),
      );

      // Clear the input field after deletion
      _idController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Driver'),
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
              // Driver ID TextField
              _buildTextField(
                controller: _idController,
                label: 'Driver ID',
                icon: Icons.card_membership,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the driver\'s ID to delete';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Delete Driver Button
              ElevatedButton(
                onPressed: _deleteDriver,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red color for delete action
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Delete Driver'),
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
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
