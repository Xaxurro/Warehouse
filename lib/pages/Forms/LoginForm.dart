import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/Functions/FormFunctions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Nombre
            InputText("Email", emailController, (value) {
              if (value == null || value.isEmpty) {
                return "Enter Email";
              }
              return null;
            }),
            InputText("Password", passController, (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
              }
              return null;
            }),

            FormValidation(context, _formKey)
          ],
        ),
      ),
    );
  }
}
