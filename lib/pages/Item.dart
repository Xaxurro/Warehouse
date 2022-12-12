import 'package:flutter/material.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/pages/Forms/EditItemForm.dart';

import 'Forms/AddItemForm.dart';

class Item extends StatelessWidget {
  String lbl = "";
  String id = "";

  //Constructor sin parametros
  Item() {
    lbl = "Add Item";
  }

  //Constructor edit con parametros
  Item.edit(String this.id) {
    lbl = "Edit Item";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: lbl,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(lbl),
          centerTitle: true,
          backgroundColor: globals.mainColor,
        ),
        //Dependiendo de la label que se eligio se decide si se debe editar un item existente o añadir uno nuevo
        body: (lbl == "Edit Item") ? EditItemForm(id: id) : AddItemForm(),
      ),
    );
  }
}
