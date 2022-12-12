import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/Functions/FormFunctions.dart';

import '../../services/firestore_service.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm({super.key});

  @override
  AddItemFormState createState() {
    return AddItemFormState();
  }
}

class AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();

  final item_name = TextEditingController();
  String type_name = "";
  final description = TextEditingController();
  String state = "";
  bool favorite = false;
  final stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

            //Stock
            InputNumber("Stock", stock, (value) {
              if (value == null || value.isEmpty) {
                return "Enter Stock";
              }
              return null;
            }),

            //Estado
            Row(
              children: [
                InputSelection("State", context, [
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
                ]),
                Text(state),
              ],
            ),

            //Categoria
            Row(
              children: [
                InputSelection("Type", context, [
                  ListTile(
                    title: Text("test"),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        type_name = "test";
                      });
                    },
                  ),
                ]),
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
            InputTextArea("Description (Optional)", description, (value) {
              return null;
            }),

            FormValidation(context, () {
              if (_formKey.currentState!.validate()) {
                for (int i = int.parse(stock.text); i > 0; i--) {
                  FirestoreService().addItem(item_name.text, type_name, state,
                      description.text, favorite);
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
