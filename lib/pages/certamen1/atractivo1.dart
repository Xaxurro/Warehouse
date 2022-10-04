import 'package:flutter/material.dart';

class atractivo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.amberAccent.shade700,
          title: Text('Geysers del Tatio'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/geiser tatio.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
