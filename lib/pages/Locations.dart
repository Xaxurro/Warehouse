import 'package:flutter/material.dart';
import 'package:warehouse/pages/addLocation.dart';
import 'package:warehouse/globals.dart' as globals;

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('List of locations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
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