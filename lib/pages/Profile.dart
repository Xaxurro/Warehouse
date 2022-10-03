import 'package:flutter/material.dart';
import 'package:warehouse/pages/Options/changeColor.dart';
import 'package:warehouse/functions.dart';

class Tab4Page extends StatelessWidget {
  const Tab4Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        tilePage('Color', 'Color de la aplicacion', Icons.color_lens_sharp, context, const ChangeColorPage()),
        Divider(),
      ],
    );
  }
}
