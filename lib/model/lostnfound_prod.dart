import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LostnfoundData {
  final CollectionReference lostnfoundlist =
      FirebaseFirestore.instance.collection("lostnfound");

  Future<void> lostnfound(
    String name,
    String descrip,
    String lastlocation,
    double price,
    String uid,
  ) async {
    return await lostnfoundlist.doc(uid).set({
      'Prod name': name,
      'Prod description': descrip,
      'Prod last location': lastlocation,
      'Reward price': price
    });
  }

  Future getlostnfoundList() async {
    List itemsList = [];
    try {
      await lostnfoundlist.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
