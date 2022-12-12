// const Employee({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Employee list',
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_new,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: const Text('Add Location'),
//           centerTitle: true,
//           backgroundColor: globals.mainColor,
//         ),
//         body: const Center(
//           child: EmployeeForm(),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:warehouse/pages/Item.dart';
// import 'package:warehouse/globals.dart' as globals;
// import '../services/firestore_service.dart';

// class Employee {}

// class listEmployees extends StatelessWidget {
// import 'package:flutter/material.dart';
// import 'package:warehouse/globals.dart' as globals;
// import 'package:warehouse/pages/Forms/EmployeeForm.dart';
// import 'package:warehouse/pages/Forms/LocationForm.dart';
// import 'package:warehouse/pages/Item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:warehouse/globals.dart' as globals;
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
    // return
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       //Se llama al contructor edit de la clase Item, recibe el id del item como parametro
                    //       builder: (context) =>
                    Employee.getEmployee(employee.id);

                    // );
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
