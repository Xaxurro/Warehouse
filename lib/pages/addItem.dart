import 'package:flutter/material.dart';
import 'package:warehouse/globals.dart' as globals;

class addItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Item',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Add item'),
          centerTitle: true,
          backgroundColor: globals.mainColor,
        ),
        body: const Center(
          child: Text('input text'),
        ),
      ),
    );
  }
}
