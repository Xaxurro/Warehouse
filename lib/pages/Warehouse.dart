import 'package:flutter/material.dart';

import 'package:warehouse/pages/addItem.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/providers/ItemProvider.dart';
class WarehousePage extends StatefulWidget {
  const WarehousePage({super.key});

  @override
  State<WarehousePage> createState() => _WarehousePageState();
}

class _WarehousePageState extends State<WarehousePage> {
  ItemProvider provider = new ItemProvider();

  @override
  void initState() {
    super.initState();
    provider.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("ola")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,MaterialPageRoute(
              builder: (context)=> addItem()
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}
