import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wefiwebu_2/model/lostnfound_prod.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _lnfcollect = _firestore.collection('users');

class ManageProdData {
  static String? userUid;

  static Future<void> addlnfProd({
    required String name,
    required String descrip,
    required String lastlocate,
    required double price,
  }) async {
    DocumentReference lnfdoc =
        _lnfcollect.doc(userUid).collection('lostnfoundprod').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": descrip,
      "last location": lastlocate,
      "Price": price,
    };

    await lnfdoc
        .set(data)
        .whenComplete(() => print('Lost Prod successfully added'))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference lnfCollection =
        _lnfcollect.doc(userUid).collection('lostnfoundprod');

    return lnfCollection.snapshots();
  }

  static Future<void> updateItem({
    required String name,
    required String descrip,
    required String lastlocate,
    required double price,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _lnfcollect.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "Prod name": name,
      "Prod descrip": descrip,
      "Prod last location": lastlocate,
      "Price": price,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Lost product updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _lnfcollect.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
