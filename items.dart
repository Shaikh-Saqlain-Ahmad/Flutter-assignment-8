import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<String> selectedBikes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items Screen')),
      body: Center(
        child: ListView.builder(
          itemCount: bikes.length,
          itemBuilder: (context, index) {
            final bikeName = bikes[index]['name'];
            final imageUrl = bikes[index]['imageUrl'];

            return _buildBikeItem(context, bikeName!, imageUrl!);
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/selectedItem',
              arguments: selectedBikes);
        },
        child: Text('View Selected Bikes'),
      ),
    );
  }

  Widget _buildBikeItem(
      BuildContext context, String bikeName, String imageUrl) {
    final isSelected = selectedBikes.contains(bikeName);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedBikes.remove(bikeName);
              } else {
                selectedBikes.add(bikeName);
              }
            });
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    bikeName,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          selectedBikes.add(bikeName);
                        } else {
                          selectedBikes.remove(bikeName);
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

final List<Map<String, String>> bikes = [
  {'name': 'Bike 1', 'imageUrl': 'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW90b3JiaWtlfGVufDB8fDB8fHww&w=1000&q=80'},
  {'name': 'Bike 2', 'imageUrl': 'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW90b3JiaWtlfGVufDB8fDB8fHww&w=1000&q=80'},
  {'name': 'Bike 3', 'imageUrl': 'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW90b3JiaWtlfGVufDB8fDB8fHww&w=1000&q=80'},
  {'name': 'Bike 4', 'imageUrl': 'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW90b3JiaWtlfGVufDB8fDB8fHww&w=1000&q=80'},
];
