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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: Text('Marketplace'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset("assets/images/blazer.png"),
              ),
              footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      widget.marketproduct['Product Name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text(
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
          new ListTile(
            title: new Text("Details"),
            subtitle: new Text(widget.marketproduct['Product Description']),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.marketproduct['Product Condition']),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
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
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(Icons.chat_outlined),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () {},
                ),
                
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
                  onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => Checkout(
                      product_name: widget.marketproduct['Product Name'],
                      product_price: widget.marketproduct['Product Price'],
                   ))),
                  child: const Text("Buy Now",
                  style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2.2,
                  color: Colors.white)),
                    ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
