import 'package:flutter/material.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,
      width: 100,
      padding: EdgeInsets.all(15),
      child: Container(
        color: Colors.red,
        height: 10,
        width: 10
      ),
    );
  }
}
