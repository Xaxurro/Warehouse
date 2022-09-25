import 'package:flutter/material.dart';
import 'package:warehouse/screen/tabs/tab1.dart';
import 'package:warehouse/screen/tabs/tab2.dart';
import 'package:warehouse/screen/tabs/tab3.dart';
import 'package:warehouse/screen/tabs/tab4.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            bottom: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: Colors.red.shade200),
                tabs: [
                  Icon(Icons.card_giftcard_sharp),
                  Icon(Icons.flag),
                  Icon(Icons.keyboard),
                  Icon(Icons.car_rental)
                ]),
            title: Text('TABS'),
          ),
          body: TabBarView(
            children: [
              Tab1Page(),
              Tab2Page(),
              Tab3Page(),
              Tab4Page(),
            ],
          ),
        ));
  }
}
