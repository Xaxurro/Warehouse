import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/screen/tabs/tab1.dart';
import 'package:warehouse/screen/tabs/tab2.dart';
import 'package:warehouse/screen/tabs/tab3.dart';
import 'package:warehouse/screen/tabs/tab4.dart';

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
      // BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.house),
      //         label: 'Home',
      //         backgroundColor: Colors.red),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.warehouse),
      //         label: 'Items',
      //         backgroundColor: Colors.red),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.location_on),
      //         label: 'Locations',
      //         backgroundColor: Colors.red),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.people_alt),
      //         label: 'Personal',
      //         backgroundColor: Colors.red),
      //   ],
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.black,
      //   currentIndex: _index,
      //   onTap: (index) {
      //     setState(() {
      //       _index = index;
      //     });
      //   },
      // ),
    );
  }
}
