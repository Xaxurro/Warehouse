import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/pages/Forms/EditItemForm.dart';

import 'package:warehouse/pages/Item.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/services/firestore_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
                          FirestoreService().deleteItem(items.id);
                        }
                    )
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
                            context,MaterialPageRoute(
                            //Se llama al contructor edit de la clase Item, recibe el id del item como parametro
                              builder: (context)=> Item.edit(items.id)
                            ),
                          );
                        }
                    )
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.handyman,
                    color: Colors.deepPurple,
                  ),
                  title: Text(items['Item_name']),
                  subtitle: Text('${items['Description'].toString()}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,MaterialPageRoute(
              builder: (context)=> Item()
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: globals.mainColor,
      ),
    );
  }
}
