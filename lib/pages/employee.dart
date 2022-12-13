// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Profile.dart';
import '../services/firestore_service.dart';

class Employee extends StatelessWidget {
  // String lbl = "";
  // String id = "";

  Employee() {
    // lbl = "Add Item";
  }

  // //Constructor edit con parametros
  // Employee.edit(String this.id) {
  //   lbl = "Edit Item";
  // }
  Employee.getEmployee(String id) {
    print('AQUI ESTA LA WEA           ' + id);
    // return id;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: globals.mainColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Add Employee"),
        ),
        body: listEmployee(),
      ),
    );
  }
}

class listEmployee extends StatelessWidget {
  // const listEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: [Icon(Icons.more_vert)]),
      body: StreamBuilder(
        stream: FirestoreService().getAllEmployees(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var employee = snapshot.data!.docs[index];
              print('EMPLEADO: ' + employee['items'].toString());
              var text = employee['items'];
              print('items: ' + text[0].toString());
              // Lo que hace que al deslizar aparezcan opciones
              return Slidable(
                //izq a derecha
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                        backgroundColor: Colors.redAccent.shade400,
                        icon: Icons.delete_outlined,
                        label: "Delete",
                        //Elimina ese item
                        onPressed: (context) {
                          FirestoreService().deleteItem(employee.id);
                        })
                  ],
                ),
                //derecha a izq
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                        backgroundColor: Colors.blueAccent.shade400,
                        icon: Icons.edit_outlined,
                        label: "Edit",
                        //Ir a editar ese item
                        onPressed: (context) {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       //Se llama al contructor edit de la clase Item, recibe el id del item como parametro
                          //       builder: (context) => Item.edit(employee.id)),
                          // );
                        })
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.handyman,
                    color: Colors.deepPurple,
                  ),
                  title: Text(employee['Employee_name']),
                  subtitle: Text('${employee['items'].toString()}'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            //Se llama al contructor edit de la clase Item, recibe el id del item como parametro
                            builder: (context) => Profile(employee.id)));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Employee()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  String id;
  Profile(this.id);

  @override
  Widget build(BuildContext context) {
    print('Esta esta en la pagina del perfil ' + id);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
          backgroundColor: globals.mainColor,
          // title: FutureBuilder(
          //   future: FirestoreService().getEmployee(id),

          // ),
        ),
        body: Center(
          child: FutureBuilder(
            future: FirestoreService().getEmployee(id),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Text('Cargando...');
              }
              return Text(
                snapshot.data,
                style: TextStyle(fontSize: 12),
              );
            },
          ),
        ));

    // Future<Map<String, dynamic>> valor = FirestoreService().getEmployee(id);

    // String aux = valor.toString();
    // print('Esto es lo que esta en aux: ' + aux);

    // var aux = valor['Employee_name'];
  }
}
