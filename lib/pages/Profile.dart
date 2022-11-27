import 'package:flutter/material.dart';
import 'package:warehouse/pages/Options/changeColor.dart';
import 'package:warehouse/Functions/TileFunctions.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        tilePage('Color', 'Color App', Icons.color_lens_sharp, context, const ChangeColorPage()),
        Divider(),
      ],
    );
  }
}
