import 'package:cloud_firestore/cloud_firestore.dart';

class ItemProvider {

   Stream<QuerySnapshot> getItems() {
    return FirebaseFirestore.instance.collection('Items').snapshots();
  }
}
