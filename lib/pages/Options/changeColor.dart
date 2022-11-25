import 'package:flutter/material.dart';
import 'package:warehouse/Functions/TileFunctions.dart';
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
       leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ),
      body: ListView(
        children: [
          tileColor("Rojo", "", Icons.color_lens, Colors.redAccent.shade700, context),
          Divider(thickness: 1,),
          tileColor("Azul", "", Icons.color_lens, Colors.blueAccent.shade700, context),
          Divider(thickness: 1,),
          tileColor("Amarillo", "", Icons.color_lens, Colors.yellowAccent.shade700, context),
          Divider(thickness: 1,),
          tileColor("Morado", "", Icons.color_lens, Colors.purpleAccent.shade700, context),
          Divider(thickness: 1,),
          tileColor("Verde", "", Icons.color_lens, Colors.greenAccent.shade700, context),
          Divider(thickness: 1,),
          tileColor("Naraja", "", Icons.color_lens, Colors.orangeAccent.shade700, context),
          Divider(thickness: 1,),
        ]
      ),
    );
  }
}