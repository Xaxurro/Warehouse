import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Dashboard.dart';
import 'package:warehouse/pages/Options/changeColor.dart';
import 'package:warehouse/pages/Warehouse.dart';
import 'package:warehouse/pages/Locations.dart';
import 'package:warehouse/pages/Profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warehouse',
      home: BottomTabBar(),
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
  List<Widget> _pages = [Tab1Page(), Tab2Page(), Tab3Page(), Tab4Page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse'),
        centerTitle: true,
        backgroundColor: globals.mainColor,
      ),
      body: _pages[_index],
      bottomNavigationBar: GNav(
          tabs: [
            GButton(
              icon: Icons.house_outlined,
              text: 'Dashboard',
            ),
            GButton(
              icon: Icons.warehouse_outlined,
              text: 'Warehouse',
            ),
            GButton(
              icon: Icons.location_on_outlined,
              text: 'Location',
            ),
            GButton(
              icon: Icons.person_outline,
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
