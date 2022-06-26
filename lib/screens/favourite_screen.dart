import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wefiwebu_2/Home_btmnavbar_screen.dart';
import 'package:wefiwebu_2/model/lostnfound_prod.dart';
import 'package:wefiwebu_2/model/user_model.dart';
import 'package:wefiwebu_2/screens/Marketplace_screen.dart';
import 'package:wefiwebu_2/screens/Addlostitem_screen.dart';
import 'package:wefiwebu_2/screens/edit_lostnfoundprod.dart';
import 'package:wefiwebu_2/screens/home_screen.dart';
import 'package:wefiwebu_2/screens/lostnfound_product_page.dart';
import 'package:wefiwebu_2/screens/product_details.dart';
import 'package:wefiwebu_2/screens/profile_screen.dart';
import 'package:wefiwebu_2/screens/profileupdate_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wefiwebu_2/screens/searchScreen_lostnfound.dart';

import '../screens/lostnfound_product_page.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List marketProdList = [];

  fetchmarketProducts() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot mp = await _firestoreInstance.collection("marketplace").get();
    setState(() {
      for (int i = 0; i < mp.docs.length; i++) {
        marketProdList.add({
          'Product Name': mp.docs[i]['Product Name'],
          'Product Description': mp.docs[i]['Product Description'],
          'Product Condition': mp.docs[i]['Product Condition'],
          'Product Price': mp.docs[i]['Product Price'],
          'Product Brand': mp.docs[i]['Product Brand'],
        });
      }
    });
  }

  @override
  void initState() {
    fetchmarketProducts();
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
                'Wishlist & Favourite',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.pinkAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
              child: SafeArea(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user-wishlist')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('product')
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
                      return Center(child: Text('No favourite product'));
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          DocumentSnapshot dataSnap =
                              snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ProductDetails(marketProdList[index]))),
                            child: Card(
                              elevation: 5,
                              color: Colors.grey.shade200,
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Image.asset(
                                    "assets/images/avatar.png",
                                  ),
                                ),
                                title: Text(
                                  dataSnap['name'],
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Text(dataSnap['condition']),
                                    Text(
                                      "RM ${dataSnap['price']}",
                                      style: TextStyle(color: Colors.redAccent),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                trailing: GestureDetector(
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.remove_circle,
                                    ),
                                  ),
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('user-wishlist')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection('product')
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
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            )));
  }
}
