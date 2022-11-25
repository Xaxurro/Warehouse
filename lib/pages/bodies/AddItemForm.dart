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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputText("Name", ItemName, (value) {
            if (value == null || value.isEmpty) {
              return "Enter Text";
            }
            return null;
          }),

          //Stock
          InputText("Stock", ItemName, (value) {
            if (value == null || value.isEmpty) {
              return "Enter Text";
            }
            return null;
          }),

          //Estado
          InputText("Name", ItemName, (value) {
            if (value == null || value.isEmpty) {
              return "Enter Text";
            }
            return null;
          }),

          //Favorito
          InputText("Name", ItemName, (value) {
            if (value == null || value.isEmpty) {
              return "Enter Text";
            }
            return null;
          }),
          
          //Categoria
          //Descripcion
          FormValidation(context, _formKey)
        ],
      ),
    );
  }
}