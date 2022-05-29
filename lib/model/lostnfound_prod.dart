import 'dart:convert';
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:wefiwebu_2/screens/lostnfound_produt_page.dart';

class LostnfoundData extends Equatable {
  final String name;
  final String descrip;
  final String lastlocation;
  final String imgUrl;
  double price;
  final int id;
  int quantity;

  LostnfoundData({
    required this.id,
    required this.name,
    required this.descrip,
    required this.lastlocation,
    required this.imgUrl,
    this.price = 0,
    this.quantity = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'Prod id': id,
      'Prod name': name,
      'Prod description': descrip,
      'Prod last location': lastlocation,
      'Prod image': imgUrl,
      'Reward price': price,
      'quantity': quantity
    };
  }

  @override
  List<Object?> get props {
    return [id, name, descrip, lastlocation, imgUrl, price, quantity];
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
        id: id ?? this.id,
        name: name ?? this.name,
        descrip: descrip ?? this.descrip,
        lastlocation: lastlocation ?? this.lastlocation,
        imgUrl: imgUrl ?? this.imgUrl,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  factory LostnfoundData.fromMap(Map<String, dynamic> map) {
    return LostnfoundData(
        id: map['id'],
        name: map['Prod name'],
        descrip: map['Prod description'],
        lastlocation: map['Prod last location'],
        imgUrl: map['Prod image'],
        price: map['Reward price'],
        quantity: map['quantity']);
  }

  String toJson() => json.encode(toMap());
  factory LostnfoundData.fromJson(String source) =>
      LostnfoundData.fromMap(json.decode(source));

  bool get stringfy => true;
}
