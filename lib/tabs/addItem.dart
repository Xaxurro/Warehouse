import 'package:flutter/material.dart';

class addItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
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
          backgroundColor: Colors.redAccent.shade700,
        ),
        body: const Center(
          child: Text('input text'),
        ),
      ),
    );
  }
}
