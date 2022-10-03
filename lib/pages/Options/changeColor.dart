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
          Divider(thickness: 1,),
          tileColor("Azul", "", Icons.color_lens, Colors.blueAccent.shade700),
          Divider(thickness: 1,),
          tileColor("Amarillo", "", Icons.color_lens, Colors.yellowAccent.shade700),
          Divider(thickness: 1,),
          tileColor("Morado", "", Icons.color_lens, Colors.purpleAccent.shade700),
          Divider(thickness: 1,),
          tileColor("Verde", "", Icons.color_lens, Colors.greenAccent.shade700),
          Divider(thickness: 1,),
          tileColor("Naraja", "", Icons.color_lens, Colors.orangeAccent.shade700),
          Divider(thickness: 1,),
        ]
      ),
    );
  }
}