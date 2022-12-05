import 'package:flutter/material.dart';
import 'package:warehouse/pages/Forms/LoginForm.dart';
import 'package:warehouse/pages/addLocation.dart';
import 'package:warehouse/globals.dart' as globals;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: LoginForm()),
    );
  }
}
