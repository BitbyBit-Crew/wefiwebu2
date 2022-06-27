// ignore_for_file: unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../service/storage_service.dart';

class Addmarketproduct_screen extends StatefulWidget {
  @override
  State<Addmarketproduct_screen> createState() =>
      _Addmarketproduct_screenState();
}

class _Addmarketproduct_screenState extends State<Addmarketproduct_screen> {
  TextEditingController MPname = new TextEditingController();
  TextEditingController MPdesc = new TextEditingController();
  TextEditingController MPcond = new TextEditingController();
  TextEditingController MPbrand = new TextEditingController();
  TextEditingController MPprice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future addMarketprod() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentuser = _auth.currentUser;
      CollectionReference collectRef =
          FirebaseFirestore.instance.collection('user-marketprod');
      return collectRef
          .doc(currentuser!.uid)
          .collection('market-items')
          .doc()
          .set({
        'Product Name': MPname.text,
        'Product Description': MPdesc.text,
        'Product Condition': MPcond.text,
        'Product Brand': MPbrand.text,
        'Product Price': double.parse(MPprice.text),
      });
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Add Product"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: MPname,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.abc_sharp),
                    hintText: "Product Name",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: MPdesc,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Product Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: MPcond,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.maps_home_work),
                    hintText: "Product Condition",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: MPbrand,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.maps_home_work),
                    hintText: "Product Brand",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: MPprice,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Product price is required");
                  }
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    hintText: "Product Price",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              // image upload
              Material(
                elevation: 2,
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  onPressed: () async {},
                  child: Text(
                    'Upload Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.pinkAccent,
                child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      addMarketprod();

                      MPname.clear();
                      MPdesc.clear();
                      MPcond.clear();
                      MPbrand.clear();
                      MPprice.clear();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Product Added to Marketplace'),
                            );
                          });
                    },
                    child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
