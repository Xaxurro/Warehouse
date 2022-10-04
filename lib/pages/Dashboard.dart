import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warehouse/pages/certamen1/page1.dart';

import 'certamen1/page2.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: certamenBody(),
    );
  }
}

class certamenBody extends StatelessWidget {
  const certamenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
            child: ListTile(
          leading: Icon(Icons.book),
          title: Text("Certamen 1 Joaquin Puga"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Certamen1()));
          },
        ))
      ],
    );
  }
}

class Certamen1 extends StatelessWidget {
  const Certamen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'C1 DAM020-2022-2',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        bottom: PreferredSize(
          child: Text(
            "Joaquin Puga Salvo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.zero,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Certamen1body(),
    );
  }
}

class Certamen1body extends StatefulWidget {
  Certamen1body({Key? key}) : super(key: key);

  @override
  State<Certamen1body> createState() => _Certamen1bodyState();
}

class _Certamen1bodyState extends State<Certamen1body> {
  int _index = 0;
  List<Widget> _pages = [page1(), page2()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: GNav(
        // type: BottomNavigationBarType.fixed

        tabs: [
          GButton(
            icon: (_index == 0)
                ? Icons.room_service_rounded
                : Icons.room_service_outlined,
            text: 'Servicios',
          ),
          GButton(
            icon: (_index == 1)
                ? Icons.supervisor_account
                : Icons.supervisor_account_outlined,
            text: 'Contacto',
          )
        ],
        selectedIndex: _index,
        onTabChange: (index) {
          setState(() {
            _index = index;
          });
        },
        backgroundColor: Colors.amberAccent.shade700,
      ),
    );
  }
}
