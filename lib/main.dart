import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:warehouse/tabs/tab1.dart';
import 'package:warehouse/tabs/tab2.dart';
import 'package:warehouse/tabs/tab3.dart';
import 'package:warehouse/tabs/tab4.dart';

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
        title: Text('Bottom Tab Bar'),
        backgroundColor: Colors.redAccent.shade700,
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
          backgroundColor: Colors.redAccent.shade700),
    );
  }
}