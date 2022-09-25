import 'package:flutter/material.dart';
import 'package:warehouse/screen/home_screen.dart';
import 'package:warehouse/screen/tabScreen.dart';
import 'package:warehouse/screen/BottomTabBar.dart';


void main() => runApp(App());

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        	title: 'Titulo de MaterialApp',
          theme: ThemeData.dark(),
          home: BottomTabBar(),
        );
    }
}