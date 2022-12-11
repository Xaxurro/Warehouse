import 'package:flutter/material.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Forms/LocationForm.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Location',
      home: Scaffold(
        appBar: AppBar(
          leading :IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Add Location'),
          centerTitle: true,
          backgroundColor: globals.mainColor,
        ),
        body: const Center(
          child: LocationForm(),
        ),
      ),
    );
  }
}