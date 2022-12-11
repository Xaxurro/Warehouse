import 'package:flutter/material.dart';
import 'package:warehouse/globals.dart' as globals;
import 'package:warehouse/services/firestore_service.dart';

Widget FormPadding(Widget input) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: input,
    );
  
Widget FormValidation(BuildContext context, void Function() function) => FormPadding(
    ElevatedButton(
      onPressed: function,
      child: const Text('Submit'),
      style: ElevatedButton.styleFrom(
        backgroundColor: globals.mainColor
      ),
    ),
);

Widget InputText(String label, TextEditingController controller, String? Function(String?)? validation) => FormPadding(
  TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label
    ),
    validator: validation,
  ),
);

Widget InputTextArea(String label, TextEditingController controller, String? Function(String?)? validation) => FormPadding(
  TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label
    ),
    validator: validation,
    maxLines: null,
  ),
);

Widget InputNumber(String label, TextEditingController controller, String? Function(String?)? validation) => FormPadding(
  TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
    ),
    keyboardType: TextInputType.number,
    validator: validation,
  ),
);

Widget InputBoolean(String label, bool state, void Function(bool?) change) => FormPadding(
  Row(
    children: [
      SizedBox(
        width: 10,
        child: Checkbox(
          value: state,
          activeColor: globals.mainColor,
          onChanged: change,
        ),
      ),
      SizedBox(width: 10.0),
      Text(label)
    ]
  )
);

Widget InputSelection(String label, BuildContext context, List<ListTile> list) => FormPadding(
  ElevatedButton(
    child: Text(label),
    onPressed: (() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: list,
            ),
            height: list.length * 60,
          );
        }
      );
    }),
    style: ElevatedButton.styleFrom(
      backgroundColor: globals.mainColor
    ),
  ),
);