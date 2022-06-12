import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wefiwebu_2/screens/placeorder_screen.dart';

class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();

  final product_name;
  // final product_picture;
  final product_price;


  const Checkout({
    required this.product_name,
    // required this.product_picture,
    required this.product_price,
  });
}

class _CheckoutState extends State<Checkout> {
  final commentsCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.pink,
          title: Text('Checkout'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        // ignore: unnecessary_new
        body: new ListView(children: <Widget>[
          new Container(
            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset("assets/images/blazer.png"),
              ),
              footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      widget.product_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text(
                          "\RM${widget.product_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        )),
                      ],
                    ),
                  )),
            ),
          ),
          new Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            color: Colors.red[300],
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text(
                      'Shipping Method',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    subtitle: Text(
                      'Meet Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            color: Colors.grey[900],
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text(
                      'Cash',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    subtitle: Text(
                      'Pay by cash during meet up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          TextFormField(
            controller: commentsCon,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Please leave message. Pick up point/time/etc..',
            ),
            onSaved: (String? value) {
            commentsCon.text = value!;
      },
          ),

          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => PlaceOrder(
                    prod_name : widget.product_name,
                    prod_price : widget.product_price,
                    comment : commentsCon.value
                    )
                  ),
                ),
                
                color: Colors.pinkAccent,
                padding: const EdgeInsets.all(20.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                      fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ]));
  }
}
