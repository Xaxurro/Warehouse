import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:warehouse/pages/addItem.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/services/firestore_service.dart';
class WarehousePage extends StatelessWidget {
  const WarehousePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreService().getAllItems(),
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
              var items = snapshot.data!.docs[index];
              return ListTile(
                leading: Icon(
                  Icons.handyman,
                  color: Colors.deepPurple,
                ),
                title: Text(items['Item_name']),
                subtitle: Text('${items['Description'].toString()}'),
                /*
                trailing: OutlinedButton(
                  child: Text('Borrar'),
                  onPressed: () {
                    FirestoreService().borrar(items.id);
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
