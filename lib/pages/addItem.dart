import 'package:flutter/material.dart';
import 'package:warehouse/globals.dart' as globals;

class addItem extends StatelessWidget {
  const addItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Item',
      home: Scaffold(
        appBar: AppBar(
          leading :IconButton(icon: Icon(Icons.turn_left,color: Colors.white,),onPressed: () {
            Navigator.pop(context);
          },) ,
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