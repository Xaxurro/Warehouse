import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/Functions/FormFunctions.dart';

import '../../services/firestore_service.dart';

class ItemForm extends StatefulWidget {
  final String? id;
  const ItemForm({super.key, required this.id});


  @override
  ItemFormState createState() {
    return ItemFormState();
  }
}

class ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();

  final item_name = TextEditingController();
  String type_name = "";
  final description = TextEditingController();
  String state = "";
  bool favorite = false;
  final stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.id != ""){
      final item = FirestoreService().getItem(widget.id.toString()).get().then(
        (DocumentSnapshot ds) {
          final data = ds.data() as Map<String, dynamic>;
          item_name.text = data["Item_name"];
          type_name = data["Type_name"];
          description.text = data["Description"];
          state = data["State"];
          favorite = data["Favorite"];
        }
      );
    }

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
            
            //Categoria
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