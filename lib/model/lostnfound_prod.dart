import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LostnfoundData {
  final String name;

  final String descrip;
  final String lastlocation;
  // final String imgUrl;
  final double price;
  // final String categid;
  // final int quantity;
  final String owner;

  LostnfoundData({
    required this.name,
    required this.descrip,
    required this.lastlocation,
    // required this.imgUrl,
    required this.price,
    // required this.categid,
    // required this.quantity,
    required this.owner,
  });

  Map<String, dynamic> toJson() => {
        'Prod name': name,
        'Prod description': descrip,
        'Prod last location': lastlocation,
        'Reward price': price,
        'owner': owner,
      };

  static LostnfoundData fromJson(Map<String, dynamic> json) => LostnfoundData(
      name: json['Prod name'],
      descrip: json['Prod description'],
      lastlocation: json['Prod last location'],
      price: json['Reward price'],
      owner: json['owner']);
}

Future addlnfprod(LostnfoundData lnfprod) async {
  final lnfdoc = FirebaseFirestore.instance.collection('lostnfound').doc();
  // lnfprod.createdId = lnfdoc.id;

  final json = lnfprod.toJson();
  await lnfdoc.set(json);
}

Future updatelnfprod(LostnfoundData lnfprod) async {
  final updatelnf = FirebaseFirestore.instance.collection('lostnfound').doc();
  // lnfprod.createdId = updatelnf.id;

  final json = lnfprod.toJson();
  await updatelnf.set(json);
}
