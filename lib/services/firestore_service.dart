import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:warehouse/pages/employee.dart';

class FirestoreService {
  //obtener todos
  Stream<QuerySnapshot> getAllItems() {
    return FirebaseFirestore.instance
        .collection('Item')
        .orderBy("Favorite")
        .snapshots();
  }

  Stream<QuerySnapshot> getAllEmployees() {
    return FirebaseFirestore.instance.collection('Employee').snapshots();
  }

  //obtener 1
  Future<Map<String, dynamic>> getItem(String id) {
    return FirebaseFirestore.instance
        .collection('Item')
        .doc(id)
        .get()
        .then((DocumentSnapshot ds) {
      print("ID: " + id);
      //Lo parseamos a un map (Diccionario)
      return ds.data() as Map<String, dynamic>;
    });
  }

  //agregar
  Future addItem(String Item_name, String Type_name, String State,
      String Description, bool Favourite) {
    return FirebaseFirestore.instance.collection('Item').doc().set({
      'Item_name': Item_name,
      'Type_name': Type_name,
      'State': State,
      'Description': Description,
      'Favorite': Favourite,
      'Deleted': false
    });
  }

  //borrar
  Future deleteItem(String id) {
    return FirebaseFirestore.instance.collection('Item').doc(id).delete();
  }

  Stream<QuerySnapshot> getAllLocations() {
    return FirebaseFirestore.instance.collection('Location').snapshots();
  }

  //agregar
  Future agregarLocations(String Location_name, String Description) {
    return FirebaseFirestore.instance.collection('Location').doc().set({
      'Location_name': Location_name,
      'Description': Description,
      'Deleted': false
    });
  }

  //borrar
  Future deleteLocations(String id) {
    return FirebaseFirestore.instance.collection('Location').doc(id).delete();
  }

  // Future getData(String id) {
  //   return FirebaseFirestore.instance.doc(id).get();
  // }

  Future<Map<String, dynamic>> getEmployee(String id) {
    return FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .get()
        .then((DocumentSnapshot ds) {
      print("ID: " + id);
      //Lo parseamos a un map (Diccionario)
      return ds.data() as Map<String, dynamic>;
    });
  }
}
