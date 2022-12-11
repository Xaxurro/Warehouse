import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/pages/addLocation.dart';
import 'package:warehouse/globals.dart' as globals;

import '../services/firestore_service.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: const Center(
    //     child: Text('List of locations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.push(
    //         context,MaterialPageRoute(
    //           builder: (context)=> const addLocation()
    //         ),
    //       );
    //     },
    //     child: const Icon(Icons.add),
    //     backgroundColor: globals.mainColor,
    //   ),
    // );
    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreService().getAllLocations(),
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
              var locations = snapshot.data!.docs[index];
              return ListTile(
                leading: Icon(
                  Icons.warehouse,
                  color: Colors.deepPurple,
                ),
                title: Text(locations['Location_name']),
                subtitle: Text('Description:${locations['Description'].toString()}'),
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
              builder: (context)=> addLocation()
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}