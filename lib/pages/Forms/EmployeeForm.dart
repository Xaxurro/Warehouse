import 'package:flutter/material.dart';
import 'package:warehouse/Functions/FormFunctions.dart';
//import 'package:flutter/services.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  EmployeeFormState createState() {
    return EmployeeFormState();
  }
}

class EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  final LocationName = TextEditingController();
  final LocationDirection = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputText("Name", LocationName, (value) {
            if (value == null || value.isEmpty) {
              return "Enter Text";
            }
            return null;
          }),
          InputText("Direction", LocationDirection, (value) {
            if (value == null || value.isEmpty) {
              return "Enter Text";
            }
            return null;
          }),
          FormValidation(context, () => print("ADDLOCATION.DART"))
        ],
      ),
    );
  }
}
