import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/Functions/FormFunctions.dart';

import '../../services/firestore_service.dart';

class EditItemForm extends StatefulWidget {
  //Se declara la variable que va a ser requerida para instanciar un objeto
  final String? id;
  const EditItemForm({super.key, required this.id});


  @override
  EditItemFormState createState() {
    //Obtenemos el doc especifico, aplicamos metodo get para recibir los datos y el metodo then para procesar todos los datos recibidos (1)
    FirestoreService().getItem(id.toString()).get().then(
      (DocumentSnapshot ds) {
        //Lo parseamos a un map (Diccionario)
        final data = ds.data() as Map<String, dynamic>;
      }
    );
    return EditItemFormState();
  }
}

class EditItemFormState extends State<EditItemForm> {
  final _formKey = GlobalKey<FormState>();

  final item_name = TextEditingController();
  String type_name = "";
  final description = TextEditingController();
  String state = "";
  bool favorite = false;
  final stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.data)
    item_name.text = data["Item_name"];
    type_name = data["Type_name"];
    description.text = data["Description"];
    state = data["State"];
    favorite = data["Favorite"];
    data.forEach((key, value) {print(key + " : " + value.toString());});

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Nombre
            InputText("Name", item_name, (value) {
              if (value == null || value.isEmpty) {
                return "Enter Name";
              }
              return null;
            }),
      
            //Estado
            Row(
              children: [
                InputSelection(
                  "State",
                  context,
                  [
                    ListTile(
                      leading: Icon(Icons.warehouse),
                      title: Text("Warehouse"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                        state = "Warehouse";
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(CupertinoIcons.car),
                      title: Text("Terrain"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          state = "Terrain";
                        });
                      },
                    ),
                  ]
                ),
                Text(state),
              ],
            ),
            
            //Categoria
            Row(
              children: [
                InputSelection(
                  "Type",
                  context,
                  [
                    ListTile(
                      title: Text("test"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          type_name = "test";
                        });
                      },
                    ),
                  ]
                ),
                Text(type_name),
              ],
            ),
      
            //Favorito
            InputBoolean("Favourite", favorite, (value) {
                setState(() {
                  favorite = !favorite;
                });
            }),
      
            //Descripcion
            InputTextArea("Description (Optional)", description, (value) {return null;}),
      
            FormValidation(context, () {
              if (_formKey.currentState!.validate()) {
                for(int i = int.parse(stock.text); i > 0; i--){
                  FirestoreService().addItem(item_name.text, type_name, state, description.text, favorite);
                }
                //Navigator.of(context).pop();
              }
            })
          ],
        ),
      ),
    );
  }
}