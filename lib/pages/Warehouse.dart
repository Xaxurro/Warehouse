import 'package:flutter/material.dart';

import 'package:warehouse/pages/addItem.dart';
import 'package:warehouse/globals.dart' as globals;
class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Tab 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,MaterialPageRoute(
              builder: (context)=> addItem()
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}
