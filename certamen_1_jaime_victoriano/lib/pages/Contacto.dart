import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ContactoPage extends StatefulWidget {
  ContactoPage({Key? key}) : super(key: key);

  @override
  State<ContactoPage> createState() => _ContactoPageState();
}

class _ContactoPageState extends State<ContactoPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo Electronico'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Ingrese un correo electronico';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Ingrese una edad';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Procesando Informacion')),
                        );
                      }
                    },
                    child: Text('Enviar'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
