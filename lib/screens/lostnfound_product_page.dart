import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:wefiwebu_2/model/user_model.dart';
import 'package:wefiwebu_2/screens/chat_screen.dart';
=======
>>>>>>> 112eee28db8a4888ba6af5245fc0d74ceda4845e

class LnfProductPage extends StatefulWidget {
  var lnfproduct;
  LnfProductPage(this.lnfproduct);
  @override
  State<LnfProductPage> createState() => _LnfProductPageState();
}

class _LnfProductPageState extends State<LnfProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
              ),
            ),
          )),
      body: ListView(
        //     child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         height: 300,
        //         color: Colors.white,
        //         child: Image.asset(
        //           "assets/images/avatar.png",
        //         ),
        //       ),

        //       Text(widget.lnfproduct['Prod name']),
        //       Text(widget.lnfproduct['Prod description']),
        //       Text(widget.lnfproduct['Prod last location']),
        //       Text(widget.lnfproduct['Reward price'].toString()),
        //       SizedBox(
        //         width: 10,
        //         height: 56,
        //       )
        //     ],
        //   ),
        // )
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset("assets/images/avatar.png"),
              ),
              footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      widget.lnfproduct['Prod name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text(
                          "\RM${widget.lnfproduct['Reward price']}",
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
            title: new Text("Product Details"),
            subtitle: Text(widget.lnfproduct['Prod description']),
          ),
          Divider(),
          new ListTile(
            title: new Text("Last Location"),
            subtitle: Text(widget.lnfproduct['Prod last location']),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name : ${widget.lnfproduct['Prod name']} ",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
