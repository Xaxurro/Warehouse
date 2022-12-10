import 'package:cloud_firestore/cloud_firestore.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ItemProvider().getItems(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var producto = snapshot.data!.docs[index];
              //print('PRODUCTO:' + producto.data().toString());
              return ListTile(
                leading: Icon(
                  Icons.handyman,
                  color: Colors.deepPurple,
                ),
                title: Text(producto['nombre']),
                subtitle: Text('Stock:${producto['stock'].toString()}'),
                /*
                trailing: OutlinedButton(
                  child: Text('Borrar'),
                  onPressed: () {
                    FirestoreService().borrar(producto.id);
                  },
                ),
                */
              );
            },
          );
        },
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
