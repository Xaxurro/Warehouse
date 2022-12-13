// import 'package:ejemplo_firebase/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Dashboard.dart';
import 'package:warehouse/pages/Warehouse.dart';
import 'package:warehouse/pages/Locations.dart';
import 'package:warehouse/pages/ConfigPage.dart';
import 'package:warehouse/pages/employee.dart';
import 'package:warehouse/pages/employees.dart';

// import 'package:warehouse/pages/assignment.dart';
// import 'package:warehouse/pages/Login.dart';
enum MenuItem {
  addPerson,
  toolAssignment,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: LoginPage(),
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

  var appBarHeight = AppBar().preferredSize.height;
  List<Widget> _pages = [
    DashboardPage(),
    WarehousePage(),
    LocationsPage(),
    // AssignmentPage(),
    // LoginPage()
    ConfigPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Warehouse'),
          centerTitle: true,
          backgroundColor: globals.mainColor,
          elevation: 0,
          actions: [
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              offset: Offset(0.0, appBarHeight),
              onSelected: (value) {
                if (value == MenuItem.addPerson) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Employee()),
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: MenuItem.addPerson,
                  child: Text('list employee.'),
                )
              ],
            )
          ]),
      body: _pages[_index],
      bottomNavigationBar: GNav(
          // rippleColor: Colors.white,
          color: Colors.white,
          // hoverColor: Color.fromARGB(255, 146, 88, 88),
          activeColor: Colors.white,
          // curve: Curves.fastOutSlowIn,
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
              icon: (_index == 2)
                  ? Icons.location_on
                  : Icons.location_on_outlined,
              text: 'Location',
            ),
            // GButton(
            //   icon: (_index == 3)
            //       ? Icons.person_add_alt_1
            //       : Icons.person_add_alt_1_outlined,
            //   text: 'Assignment',
            // ),
            GButton(
              icon: (_index == 3)
                  ? Icons.person_rounded
                  : Icons.person_outline_rounded,
              text: 'Profile',
            ),
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

// String? hola = null;
