// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wefiwebu_2/model/user_model.dart';
import 'package:wefiwebu_2/screens/Marketplace_screen.dart';
import 'package:wefiwebu_2/screens/Addlostitem_screen.dart';
import 'package:wefiwebu_2/screens/Addlostitem_screen.dart';
import 'package:wefiwebu_2/screens/profile_screen.dart';
import 'package:wefiwebu_2/screens/profileupdate_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //image setting
            Image.asset(
              "assets/images/logo.jpg",
              fit: BoxFit.contain,
              width: 100,
            ),
            Container(
              //Text
              padding: const EdgeInsets.all(8.0),
              child: Text("Welcome ${loggedInUser.fullname}"),
            )
          ],
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: const Center(),
      floatingActionButton:
          SpeedDial(icon: Icons.add, backgroundColor: Colors.black, children: [
        SpeedDialChild(
          child: const Icon(Icons.approval),
          label: 'Lost & Found',
          backgroundColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addlostitem_screen()),
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.account_balance_wallet),
          label: 'Sell',
          backgroundColor: Colors.grey,
          // onTap: () {TBD},
        ),
      ]),
    ));
  }
}
