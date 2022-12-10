import 'package:ejemplo_firebase/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Dashboard.dart';
import 'package:warehouse/pages/Warehouse.dart';
import 'package:warehouse/pages/Locations.dart';
import 'package:warehouse/pages/Profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  List<Widget> _pages = [DashboardPage(), WarehousePage(), LocationsPage(), ConfigPage()]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse'),
        centerTitle: true,
        backgroundColor: globals.mainColor,
        elevation: 0,
      ),
      body: _pages[_index],
      bottomNavigationBar: GNav(
          tabs: [
            GButton(
              icon: (_index == 0) ? Icons.house : Icons.house_outlined,
              text: 'Dashboard',
            ),
            GButton(
              icon: (_index == 1) ? Icons.warehouse : Icons.warehouse_outlined,
              text: 'Warehouse',
            ),
            GButton(
              icon: (_index == 2) ? Icons.location_on : Icons.location_on_outlined,
              text: 'Location',
            ),
            GButton(
              icon: (_index == 3) ? Icons.person : Icons.person_outlined,
              text: 'Profile',
            )
          ],
          selectedIndex: _index,
          onTabChange: (index) {
            setState(() {
              _index = index;
            });
          },
          backgroundColor: globals.mainColor),
      );
  }
}