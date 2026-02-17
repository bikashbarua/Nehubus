import 'package:flutter/material.dart';

class AddRouteAdminPage extends StatefulWidget {
  const AddRouteAdminPage({super.key});

  @override
  _AddRouteAdminPageState createState() => _AddRouteAdminPageState();
}

class _AddRouteAdminPageState extends State<AddRouteAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _startPointController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endPointController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final List<Map<String, TextEditingController>> _viaPoints = [];

  String? _selectedBusId;
  final List<String> _busIdOptions = [
    'BUS001', 'BUS002', 'BUS003', 'BUS004', 'BUS005'
  ]; // Sample bus IDs

  void _addViaPoint([String location = "", String time = ""]) {
    final locationController = TextEditingController(text: location);
    final timeController = TextEditingController(text: time);
    _viaPoints.add({"location": locationController, "time": timeController});
  }

  void _removeViaPoint(int index) {
    setState(() {
      _viaPoints.removeAt(index);
    });
  }

  Future<void> _selectTime(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        final formattedTime = picked.format(context);
        controller.text = formattedTime;
      });
    }
  }

  void _addRoute() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Route added successfully!')),
      );
      _clearForm();
    }
  }

  void _clearForm() {
    _selectedBusId = null;
    _busNumberController.clear();
    _startPointController.clear();
    _startTimeController.clear();
    _endPointController.clear();
    _endTimeController.clear();
    _viaPoints.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Route'),
        backgroundColor: Colors.blue[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildBusIdDropdown(),
              const SizedBox(height: 16.0),
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
              _buildTextFieldWithTime(
                label: 'Start Point',
                locationController: _startPointController,
                timeController: _startTimeController,
                icon: Icons.location_on,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Via Points',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              for (int i = 0; i < _viaPoints.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTextFieldWithTime(
                          label: 'Via Point ${i + 1}',
                          locationController: _viaPoints[i]["location"]!,
                          timeController: _viaPoints[i]["time"]!,
                          icon: Icons.map,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () => _removeViaPoint(i),
                      ),
                    ],
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _addViaPoint();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: const Text('Add More Via Points'),
              ),
              const SizedBox(height: 20.0),
              _buildTextFieldWithTime(
                label: 'End Point',
                locationController: _endPointController,
                timeController: _endTimeController,
                icon: Icons.location_on,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _addRoute,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: const Text('Add Route'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusIdDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedBusId,
      onChanged: (String? newValue) {
        setState(() {
          _selectedBusId = newValue;
        });
      },
      items: _busIdOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Select Bus ID',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.confirmation_number),
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a bus ID';
        }
        return null;
      },
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
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
      ),
      validator: validator,
    );
  }

  Widget _buildTextFieldWithTime({
    required String label,
    required TextEditingController locationController,
    required TextEditingController timeController,
    required IconData icon,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: locationController,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
              prefixIcon: Icon(icon),
              contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a location';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: GestureDetector(
            onTap: () => _selectTime(timeController),
            child: AbsorbPointer(
              child: TextFormField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
