import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:wefiwebu_2/screens/lostnfound_product_page.dart';

class LostnfoundData extends Equatable {
  final String name;
  final String descrip;
  final String lastlocation;
  // final String imgUrl;
  double price;
  // final int id;
  // int quantity;

  LostnfoundData({
    // required this.id,
    required this.name,
    required this.descrip,
    required this.lastlocation,
    // required this.imgUrl,
    this.price = 0,
    // this.quantity = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'Prod id': id,
      'Prod name': name,
      'Prod description': descrip,
      'Prod last location': lastlocation,
      // 'Prod image': imgUrl,
      'Reward price': price,
      // 'quantity': quantity
    };
  }

  @override
  List<Object?> get props {
    return [
      name,
      descrip,
      lastlocation,
      price,
    ];
  }

  LostnfoundData copyWith({
    int? id,
    String? name,
    String? descrip,
    String? lastlocation,
    String? imgUrl,
    double? price,
    int? quantity,
  }) {
    return LostnfoundData(
        // id: id ?? this.id,
        name: name ?? this.name,
        descrip: descrip ?? this.descrip,
        lastlocation: lastlocation ?? this.lastlocation,
        // imgUrl: imgUrl ?? this.imgUrl,
        price: price ?? this.price);
    // quantity: quantity ?? this.quantity);
  }

  factory LostnfoundData.fromSnapShot(DocumentSnapshot snap) {
    return LostnfoundData(
      // id: snap['id'],
      name: snap['Prod name'],
      descrip: snap['Prod description'],
      lastlocation: snap['Prod last location'],
      // imgUrl: snap['Prod image'],
      price: snap['Reward price'],
      // quantity: snap['quantity']
    );
  }

  String toJson() => json.encode(toMap());

  bool get stringfy => true;

  static List<LostnfoundData> lnfproduct = [];
}
