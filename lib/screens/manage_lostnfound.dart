// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wefiwebu_2/model/lostnfound_prod.dart';
import 'package:wefiwebu_2/model/user_model.dart';
import 'package:wefiwebu_2/screens/Marketplace_screen.dart';
import 'package:wefiwebu_2/screens/Addlostitem_screen.dart';
import 'package:wefiwebu_2/screens/edit_lostnfoundprod.dart';
import 'package:wefiwebu_2/screens/home_screen.dart';
import 'package:wefiwebu_2/screens/lostnfound_product_page.dart';
import 'package:wefiwebu_2/screens/profile_screen.dart';
import 'package:wefiwebu_2/screens/profileupdate_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wefiwebu_2/screens/searchScreen_lostnfound.dart';

import '../screens/lostnfound_product_page.dart';

class ManagelostnfoundScreen extends StatefulWidget {
  const ManagelostnfoundScreen({Key? key}) : super(key: key);

  @override
  State<ManagelostnfoundScreen> createState() => _ManagelostnfoundScreenState();
}

class _ManagelostnfoundScreenState extends State<ManagelostnfoundScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Manage Lost & Found',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.favorite_border),
        //     color: Colors.white,
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.notifications),
        //     color: Colors.white,
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    onTap: () => Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => SearchScreen())),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search items",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),

            //list

            SizedBox(
              height: 15,
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user-lostnfound')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('lnf-items')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Something went Error '),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data == null) {
                  return Center(child: Text('No product found'));
                }
                return GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (_, index) {
                      DocumentSnapshot dataSnap = snapshot.data!.docs[index];
                      return Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 2,
                              child: Container(
                                color: Colors.grey,
                                child: Image.asset(
                                  "assets/images/avatar.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            Text(dataSnap['Product name']),
                            // Text("${lnfProdList[index]['Prod description']}"),
                            Text(dataSnap['Product location']),
                            Text("RM ${dataSnap['Reward price']}"),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.edit),
                                  ),
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              Editlostitem_screen(dataSnap))),
                                ),
                                GestureDetector(
                                  child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Icon(Icons.delete_forever_sharp)),
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('user-lostnfound')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection('lnf-items')
                                        .doc(dataSnap.id)
                                        .delete();
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text('Deleted'),
                                          );
                                        });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              },
            ))
          ],
        ),
      ),
      floatingActionButton:
          SpeedDial(icon: Icons.add, backgroundColor: Colors.black, children: [
        SpeedDialChild(
          child: const Icon(Icons.approval),
          label: 'Add Lost & Found',
          backgroundColor: Colors.grey,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addlostitem_screen()),
            );
          },
        ),
      ]),
    ));
  }
}
