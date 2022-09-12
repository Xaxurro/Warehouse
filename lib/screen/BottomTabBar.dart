import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/tabs/tab1.dart';
import 'package:flutter_application_1/screen/tabs/tab2.dart';
import 'package:flutter_application_1/screen/tabs/tab3.dart';
import 'package:flutter_application_1/screen/tabs/tab4.dart';

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
        backgroundColor: Colors.red,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'Home',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.warehouse),
              label: 'Items',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Locations',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'Personal',
              backgroundColor: Colors.red),
        ],
        currentIndex: _index,
        onTap: (index) {
          print(index);
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
