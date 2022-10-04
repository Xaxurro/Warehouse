import 'package:flutter/material.dart';
import 'package:warehouse/pages/certamen1/atractivo1.dart';
import 'package:warehouse/pages/certamen1/atractivo2.dart';
import 'package:warehouse/pages/certamen1/atractivo3.dart';
import 'package:warehouse/pages/certamen1/atractivo4.dart';

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
            child: ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text("Geysers del Tatio"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => atractivo1()));
          },
        )),
        Card(
            child: ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text("Laguna Chaxa"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => atractivo2()));
          },
        )),
        Card(
            child: ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text("Valle de la Luna"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => atractivo3()));
          },
        )),
        Card(
            child: ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text("Valle de la Muerte"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => atractivo4()));
          },
        ))
      ],
    );
  }
}
