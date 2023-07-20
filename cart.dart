import 'package:flutter/material.dart';
import 'items.dart';

class SelectedItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String>? selectedBikes = ModalRoute.of(context)!.settings.arguments as List<String>?;

    if (selectedBikes == null || selectedBikes.isEmpty) {
      
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text('Error: No bikes selected.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Selected Bikes')),
      body: ListView.builder(
        itemCount: selectedBikes.length,
        itemBuilder: (context, index) {
          final String bikeName = selectedBikes[index];
          final String imageUrl = bikes.firstWhere((bike) => bike['name'] == bikeName)['imageUrl']!;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                bikeName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
