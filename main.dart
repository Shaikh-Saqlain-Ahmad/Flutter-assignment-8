import 'package:flutter/material.dart';
import 'cart.dart';
import 'signup.dart';
import 'items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/items': (context) => ItemsScreen(),
        '/selectedItem': (context) => SelectedItemScreen(),
      },
    );
  }
}
