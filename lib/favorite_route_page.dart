import 'package:flutter/material.dart';

class FavoriteRoutePage extends StatefulWidget {
  const FavoriteRoutePage({super.key});

  @override
  State<FavoriteRoutePage> createState() => _FavoriteRoutePageState();
}

class _FavoriteRoutePageState extends State<FavoriteRoutePage> {
  final List<String> _favoriteRoutes = []; // List to store favorite routes
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  void _addFavoriteRoute() {
    final String startPoint = _startController.text;
    final String endPoint = _endController.text;

    if (startPoint.isNotEmpty && endPoint.isNotEmpty) {
      setState(() {
        // Add the new favorite route to the list
        _favoriteRoutes.add('$startPoint to $endPoint');
      });

      // Clear the text fields
      _startController.clear();
      _endController.clear();

      // Show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Favorite route added!'),
        ),
      );
    }
  }

  void _deleteFavoriteRoute(int index) {
    setState(() {
      _favoriteRoutes.removeAt(index); // Remove the route at the specified index
    });

    // Show a snackbar to indicate deletion
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Favorite route deleted!'),
      ),
    );
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Routes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _startController,
              decoration: InputDecoration(
                labelText: 'Start Point',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.start),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _endController,
              decoration: InputDecoration(
                labelText: 'End Point',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.stop),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addFavoriteRoute,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add Favorite Route',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'My Favorite Routes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _favoriteRoutes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _favoriteRoutes[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Confirm deletion
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Route'),
                                  content: const Text('Are you sure you want to delete this route?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _deleteFavoriteRoute(index); // Delete the route
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
