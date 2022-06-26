import 'dart:convert';
// import 'dart:html';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:wefiwebu_2/screens/product_details.dart';

class MarketProduct extends Equatable {
  final String MPname;
  final String MPdesc;
  final String MPcond;
  final String MPbrand;
  double MPprice;

  MarketProduct({
    required this.MPname,
    required this.MPdesc,
    required this.MPcond,
    required this.MPbrand,
    this.MPprice = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'Product Name': MPname,
      'Product Description': MPdesc,
      'Product Condition': MPcond,
      'Product Brand': MPbrand,
      'Product Price': MPprice,
    };
  }

  @override
  List<Object?> get props {
    return [MPname, MPdesc, MPcond, MPbrand, MPprice];
  }

  MarketProduct copyWith({
    int? id,
    String? MPname,
    String? MPdesc,
    String? MPcond,
    String? MPbrand,
    String? imgUrl,
    double? price,
    int? quantity,
  }) {
    return MarketProduct(
        MPname: MPname ?? this.MPname,
        MPdesc: MPdesc ?? this.MPdesc,
        MPcond: MPcond ?? this.MPcond,
        MPbrand: MPbrand ?? this.MPbrand,
        MPprice: price ?? MPprice);
  }

  factory MarketProduct.fromSnapShot(DocumentSnapshot snap) {
    return MarketProduct(
      // id: snap['id'],
      MPname: snap['Product Name'],
      MPdesc: snap['Product Description'],
      MPcond: snap['Product Condition'],
      MPbrand: snap['Product Brand'],
      // imgUrl: snap['Prod image'],
      MPprice: snap['Product Price'],
      // quantity: snap['quantity']
    );
  }
  String toJson() => json.encode(toMap());

  bool get stringfy => true;

  static List<MarketProduct> marketproduct = [];
}
