import 'package:flutter/material.dart';
import 'package:warehouse/pages/Forms/LoginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: LoginForm()),
    );
  }
}
