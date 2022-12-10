import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/Functions/FormFunctions.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm({super.key});

  @override
  AddItemFormState createState() {
    return AddItemFormState();
  }
}

class AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();

  final ItemName = TextEditingController();
  final ItemStock = TextEditingController();
  final ItemDescription = TextEditingController();
  String ItemState = "Null";
  String ItemCategory = "Null";
  bool favourite = false;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Nombre
            InputText("Name", ItemName, (value) {
              if (value == null || value.isEmpty) {
                return "Enter Name";
              }
              return null;
            }),
      
            //Stock
            InputNumber("Stock", ItemStock, (value) {
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
                  onTap: () => selectItem("Warehouse"),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.car),
                  title: Text("Terrain"),
                  onTap: () => selectItem("Terrain"),
                ),
              ]
            ),
            
            //Categoria
            InputSelection(
              "Category",
              context,
              [
                ListTile(
                  title: Text("test"),
                  onTap: () => selectItem("test"),
                ),
              ]
            ),
      
            //Favorito
            InputBoolean("Favourite", favourite, (value) {
                setState(() {
                  favourite = !favourite;
                });
            }),
      
            //Descripcion
            InputTextArea("Description (Optional)", ItemDescription, (value) {return null;}),
      
            FormValidation(context, _formKey)
          ],
        ),
      ),
    );
  }

  void selectItem(String state) {
    Navigator.pop(context);
    setState(() {
      ItemState = state;
      print(ItemState);
    });
  }

  void selectCategory(String category) {
    Navigator.pop(context);
    setState(() {
      ItemCategory = category;
      print(ItemCategory);
    });
  }
}