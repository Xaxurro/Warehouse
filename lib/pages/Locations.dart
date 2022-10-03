import 'package:flutter/material.dart';
import 'package:warehouse/pages/addLocation.dart';
import 'package:warehouse/globals.dart' as globals;

class Tab3Page extends StatelessWidget {
  const Tab3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Tab 3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,MaterialPageRoute(
              builder: (context)=> const addLocation()
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}