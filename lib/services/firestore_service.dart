import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> getAll() {
    return FirebaseFirestore.instance.collection('Item').snapshots();
  }

  //agregar
  Future agregar(String Item_name, String Type_name, String State, String Description) {
    return FirebaseFirestore.instance.collection('Item').doc().set({
      'Item_name' : Item_name,
      'Type_name' : Type_name,
      'State' : State,
      'Description' : Description,
      'Deleted' : false
    });
  }

  //borrar
  Future borrar(String id) {
    return FirebaseFirestore.instance.collection('Item').doc(id).delete();
  }
}
