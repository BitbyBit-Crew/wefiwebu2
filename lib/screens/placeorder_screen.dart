import 'package:flutter/material.dart';
import 'package:wefiwebu_2/screens/Marketplace_screen.dart';

class PlaceOrder extends StatefulWidget {
  @override
  State<PlaceOrder> createState() => _PlaceOrderState();

  final prod_name;
  // final product_picture;
  final prod_price;
  final comment;

  const PlaceOrder({
    required this.prod_name,
    // required this.product_picture,
    required this.prod_price,
    this.comment,
  });
}

class _PlaceOrderState extends State<PlaceOrder> {
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
                      widget.prod_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text(
                          "\RM${widget.prod_price}",
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

          //TextField(
          //controller: comment,
          //keyboardType: TextInputType.text,
          //decoration: InputDecoration(
          //  border: OutlineInputBorder(),
          //   hintText: comment.text,
          // ),
          // onSaved: (value) {
          // comment.text = value!;
          //),

          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  confirm(context);
                },
                color: Colors.pinkAccent,
                padding: const EdgeInsets.all(20.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Confirm",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ]));
  }

  Future<void> confirm(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Chat Seller?"),
          //content: new Text("You are awesome!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
