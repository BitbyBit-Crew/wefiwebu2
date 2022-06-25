import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wefiwebu_2/screens/checkout_screen.dart';

class ProductDetails extends StatefulWidget {
  var marketproduct;
  ProductDetails(this.marketproduct);
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future addtoWishlist() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _wishlist =
        FirebaseFirestore.instance.collection('user-wishlist');

    return _wishlist.doc(currentUser!.uid).collection('product').doc().set({
      'name': widget.marketproduct['Product Name'],
      'brand': widget.marketproduct['Product Brand'],
      'descrip': widget.marketproduct['Product Description'],
      'condition': widget.marketproduct['Product Condition'],
      'price': widget.marketproduct['Product Price'],
    }).then((value) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Like Product'),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: Text('Marketplace'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset("assets/images/blazer.png"),
              ),
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.marketproduct['Product Name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          widget.marketproduct['Product Price'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        )),
                      ],
                    ),
                  )),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Details"),
            subtitle: Text(widget.marketproduct['Product Description']),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.marketproduct['Product Condition']),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  widget.marketproduct['Product Brand'],
                ),
              )
            ],
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Message to the Seller. Pick Up point/time/etc..',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            color: Colors.pinkAccent.shade400,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.favorite_border),
                      iconSize: 50,
                      highlightColor: Colors.grey,
                      color: Colors.black,
                      onPressed: () => addtoWishlist()),
                  IconButton(
                    icon: Icon(Icons.chat_outlined),
                    color: Colors.black,
                    iconSize: 50,
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Checkout(
                                  product_name:
                                      widget.marketproduct['Product Name'],
                                  product_price:
                                      widget.marketproduct['Product Price'],
                                ))),
                    child: const Text("Buy Now",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2.2,
                            color: Colors.white)),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
