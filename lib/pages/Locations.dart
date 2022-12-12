import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/pages/Forms/EditItemForm.dart';
import 'package:warehouse/pages/Location.dart';
import 'package:warehouse/pages/Item.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/services/firestore_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreService().getAllLocations(),
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
              var locations = snapshot.data!.docs[index];
              //Lo que hace que al deslizar aparezcan opciones
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
                          FirestoreService().deleteLocations(locations.id);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                //Se llama al contructor edit de la clase Item, recibe el id del item como parametro
                                builder: (context) => Item.edit(locations.id)),
                          );
                        })
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.location_city_outlined,
                    color: Colors.deepPurple,
                  ),
                  title: Text(locations['Location_name']),
                  subtitle: Text('${locations['Description'].toString()}'),
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
            MaterialPageRoute(builder: (context) => Location()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:warehouse/pages/Forms/LocationForm.dart';
// import 'package:warehouse/pages/Location.dart';
// import 'package:warehouse/globals.dart' as globals;

// import '../services/firestore_service.dart';

// class LocationsPage extends StatelessWidget {
//   const LocationsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   body: const Center(
//     //     child: Text('List of locations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
//     //   floatingActionButton: FloatingActionButton(
//     //     onPressed: () {
//     //       Navigator.push(
//     //         context,MaterialPageRoute(
//     //           builder: (context)=> const addLocation()
//     //         ),
//     //       );
//     //     },
//     //     child: const Icon(Icons.add),
//     //     backgroundColor: globals.mainColor,
//     //   ),
//     // );
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirestoreService().getAllLocations(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.separated(
//             separatorBuilder: (context, index) => Divider(),
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var locations = snapshot.data!.docs[index];
//               return ListTile(
//                 leading: Icon(
//                   Icons.warehouse,
//                   color: Colors.deepPurple,
//                 ),
//                 title: Text(locations['Location_name']),
//                 subtitle: Text('Description:${locations['Description'].toString()}'),
//                 /*
//                 trailing: OutlinedButton(
//                   child: Text('Borrar'),
//                   onPressed: () {
//                     FirestoreService().borrar(items.id);
//                   },
//                 ),
//                 */
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,MaterialPageRoute(
//               builder: (context)=> Location()
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: globals.mainColor,
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:warehouse/pages/Forms/EditItemForm.dart';
// import 'package:warehouse/pages/Forms/LocationForm.dart';

// import 'package:warehouse/pages/Item.dart';
// import 'package:warehouse/globals.dart' as globals;
// import 'package:warehouse/services/firestore_service.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// class LocationsPage extends StatelessWidget {
//   String lbl = "";
//   String id = "";

//   //Constructor sin parametros
//   LocationsPage() {
//     lbl = "Add Location";
//   }

//   //Constructor edit con parametros
//   LocationsPage.edit(String this.id) {
//     lbl = "Edit Location";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: lbl,
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
//           title: Text(lbl),
//           centerTitle: true,
//           backgroundColor: globals.mainColor,
//         ),
//         //Dependiendo de la label que se eligio se decide si se debe editar un item existente o añadir uno nuevo
//         // body: (lbl == "Edit Location") ? EditItemForm(id: id) : LocationForm(),
//         ),

//     );
//   }
// }