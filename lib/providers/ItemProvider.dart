import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

//clase para realizar la conexión al API de monedas

class ItemProvider {
  void getItems() async {
    CollectionReference c = FirebaseFirestore.instance.collection("items");
    QuerySnapshot items = await c.get();

    if (items.docs.length != 0) {
      for (var item in items.docs) {
        print(item.data());
      }
    }
  }
}
