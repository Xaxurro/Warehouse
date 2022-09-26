import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';

<<<<<<< Updated upstream
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warehouse',
      home: HomeScreen(),
=======
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo de MaterialApp',
      // theme: ThemeData.dark(),
      home: BottomTabBar(),
>>>>>>> Stashed changes
    );
  }
}
