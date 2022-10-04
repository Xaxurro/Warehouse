import 'package:certamen_1_jaime_victoriano/pages/Contacto.dart';
import 'package:certamen_1_jaime_victoriano/pages/Turismo.dart';
import 'package:certamen_1_jaime_victoriano/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C1 DAM020-2022-2',
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _index = 0;
  List<Widget> _pages = [TurismoPage(), ContactoPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C1 DAM020-2022-2"),
        bottom: PreferredSize(
          child: Text('Jaime Victoriano',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          preferredSize: Size.zero,
        ),
        leading: Icon(Icons.check),
        centerTitle: true,
        backgroundColor: globals.mainColor,
      ),
      body: _pages[_index],
      bottomNavigationBar: GNav(
          tabs: [
            GButton(
              icon: (_index == 0)
                  ? Icons.location_on
                  : Icons.location_on_outlined,
              text: 'Tursimo',
            ),
            GButton(
              icon: (_index == 1) ? Icons.person : Icons.person_outline,
              text: 'Contacto',
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
