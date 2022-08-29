import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouse'),
        backgroundColor: Colors.red,
        leading: Icon(Icons.warehouse),
      ),
    );
  }
}
