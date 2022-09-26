import 'package:flutter/material.dart';

void main() => runApp(const addItem());

class addItem extends StatelessWidget {
  const addItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add item'),
          centerTitle: true,
          actions:<Widget>[IconButton(icon: Icon(Icons.turn_left,color: Colors.white,),onPressed: () {
            Navigator.pop(context);
          },),] ,
          backgroundColor: Colors.redAccent.shade700,
        ),
        body: const Center(
          child: Text('input text'),
        ),
      ),
    );
  }
}