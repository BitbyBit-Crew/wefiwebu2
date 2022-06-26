// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:wefiwebu_2/model/user_model.dart';

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
          SizedBox(
            height: 300.0,
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.lnfproduct['Prod name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "RM${widget.lnfproduct['Reward price']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        )),
                      ],
                    ),
                  )),
              child: Container(
                color: Colors.white,
                child: Image.asset("assets/images/avatar.png"),
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(widget.lnfproduct['Prod description']),
          ),
          Divider(),
          ListTile(
            title: Text("Last Location"),
            subtitle: Text(widget.lnfproduct['Prod last location']),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.favorite_border),
                    iconSize: 50,
                    color: Colors.white,
                    onPressed: () {}
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         content: Text('Like Product'),
                    //       );
                    //     });
                    ),
                IconButton(
                  icon: Icon(Icons.chat_outlined),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
