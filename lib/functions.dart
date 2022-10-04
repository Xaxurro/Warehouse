import 'package:flutter/material.dart';
import 'package:warehouse/style.dart' as DefaultStyle;
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Options/changeColor.dart';

ListTile tile(String title, String subtitle, IconData icon) =>
  ListTile(
    title: Text(title, style: DefaultStyle.Title,),
    subtitle: Text(subtitle),
    leading: Icon(icon),
  );

ListTile tilePage(String title, String subtitle, IconData icon, BuildContext context, dynamic Page) => 
  ListTile(
    title: Text(title, style: DefaultStyle.Title,),
    subtitle: Text(subtitle),
    leading: Icon(icon),
    onTap: () {
      Navigator.push(
        context,MaterialPageRoute(
          builder: (context) => Page
        ),
      );
    } ,
  );

ListTile tileColor(String title, String subtitle, IconData icon, Color color, BuildContext context) => 
  ListTile(
    title: Text(title, style: DefaultStyle.Title,),
    subtitle: Text(subtitle),
    leading: Icon(icon),
    onTap: () {
      globals.mainColor = color;
      Navigator.pop(context, color);
    } ,
  );