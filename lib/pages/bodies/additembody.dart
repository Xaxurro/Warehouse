import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class itemBody extends StatefulWidget {
  const itemBody({super.key});

  @override
  itemBodyState createState() {
    return itemBodyState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class itemBodyState extends State<itemBody> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<itemBodyState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child:TextFormField(            
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name Product.'
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              
            ),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child:TextFormField(decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Quantity.'
            ),keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },),),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
          
        ],
      ),
    );
  }
}