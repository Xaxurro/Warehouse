import 'package:flutter/material.dart';
import 'package:warehouse/functions.dart';
import 'package:warehouse/globals.dart' as globals;

class ChangeColorPage extends StatelessWidget {
  const ChangeColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse'),
        centerTitle: true,
        backgroundColor: globals.mainColor,
      ),
      body: ListView(
        children: [
          tileColor("Rojo", "", Icons.color_lens, Colors.redAccent.shade700),
          Divider(),
          tileColor("Azul", "", Icons.color_lens, Colors.blueAccent.shade700),
          Divider(),
          tileColor("Green", "", Icons.color_lens, Colors.greenAccent.shade700),
          Divider(),
        ]
      ),
    );
  }
}