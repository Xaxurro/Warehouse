import 'package:flutter/material.dart';
import 'NavBar.dart';

class HomeScreen extends StatelessWidget {
  final styleTextRow = new TextStyle(fontSize: 32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Warehouse'),
        backgroundColor: Colors.red,
      ),
      body: Column(children: [
        Row(
          children: <Widget>[
            Text('uno', style: styleTextRow),
            Text('dos', style: styleTextRow),
            Text('tres', style: styleTextRow),
          ],
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor: Colors.red,
        onPressed: () {
          print('HOLA (con hate)');
        },
      ),
    );
  }
}
