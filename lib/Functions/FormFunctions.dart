import 'package:flutter/material.dart';

Widget FormPadding(Widget input) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: input,
    );
  
Widget FormValidation(BuildContext context, GlobalKey<FormState> formKey) => FormPadding(
    ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Validating Data')),
          );
        }
      },
      child: const Text('Submit'),
    ),
);

Widget InputText(String label, TextEditingController controller, String? Function(String?)? validation) => FormPadding(
  TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label
    ),
    validator: validation,
  ),
);