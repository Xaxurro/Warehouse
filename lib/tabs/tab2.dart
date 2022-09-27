import 'package:flutter/material.dart';
import 'package:warehouse/tabs/addItem.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text('Tab 2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addItem()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.redAccent.shade700,
      ),
    );
  }
}
