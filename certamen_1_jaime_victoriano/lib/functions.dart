import 'package:flutter/material.dart';
import 'package:certamen_1_jaime_victoriano/style.dart' as DefaultStyle;

ListTile tile(String title, String subtitle, IconData icon) => ListTile(
      title: Text(
        title,
        style: DefaultStyle.Title,
      ),
      subtitle: Text(subtitle),
      leading: Icon(icon),
    );

ListTile tilePage(String title, String subtitle, IconData icon,
        BuildContext context, dynamic Page) =>
    ListTile(
      title: Text(
        title,
        style: DefaultStyle.Title,
      ),
      subtitle: Text(subtitle),
      leading: Icon(icon),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page),
        );
      },
    );
