import 'package:flutter/material.dart';

class ModifyDeleteRoutePage extends StatefulWidget {
  const ModifyDeleteRoutePage({super.key});

  @override
  _ModifyDeleteRoutePageState createState() => _ModifyDeleteRoutePageState();
}

class _ModifyDeleteRoutePageState extends State<ModifyDeleteRoutePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _busIdController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _startPointController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endPointController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final List<Map<String, TextEditingController>> _viaPoints = [];

  bool _isRouteLoaded = false;

  void _searchRoute() {
    setState(() {
      _isRouteLoaded = true;
      _busIdController.text = "123";
      _busNumberController.text = "ABC-456";
      _startPointController.text = "Start Point Example";
      _startTimeController.text = "08:00 AM";
      _endPointController.text = "End Point Example";
      _endTimeController.text = "05:00 PM";

      _viaPoints.clear();
      _addViaPoint("Via Point 1", "09:00 AM");
      _addViaPoint("Via Point 2", "10:30 AM");
    });
  }

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

  void _modifyRoute() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Route modified successfully!')),
      );
      _clearForm();
    }
  }

  void _deleteRoute() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Route deleted successfully!')),
    );
    _clearForm();
  }

  void _clearForm() {
    _busIdController.clear();
    _busNumberController.clear();
    _startPointController.clear();
    _startTimeController.clear();
    _endPointController.clear();
    _endTimeController.clear();
    _viaPoints.clear();
    setState(() {
      _isRouteLoaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify/Delete Route'),
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
              TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search by Bus ID or Bus Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a bus ID or bus number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _searchRoute,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: const Text('Search Route'),
              ),
              const SizedBox(height: 24.0),
              if (_isRouteLoaded) ...[
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
                  onPressed: _modifyRoute,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  child: const Text('Modify Route'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _deleteRoute,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  child: const Text('Delete Route'),
                ),
              ],
            ],
          ),
        ),
      ),
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
