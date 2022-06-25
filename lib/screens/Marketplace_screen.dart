import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wefiwebu_2/screens/home_screen.dart';
import 'package:wefiwebu_2/components/horizontal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wefiwebu_2/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wefiwebu_2/screens/product_details.dart';
import 'package:wefiwebu_2/screens/addmarketproduct_screen.dart';
import 'package:wefiwebu_2/model/marketplace_prod.dart';
import 'package:flutter/rendering.dart';
import 'package:wefiwebu_2/screens/searchScreen_marketplace.dart';

import 'favourite_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class Marketplace_Screen extends StatefulWidget {
  // Marketplace_Screen({Key? key}) : super(key: key);

  @override
  State<Marketplace_Screen> createState() => _Marketplace_ScreenState();
}

class _Marketplace_ScreenState extends State<Marketplace_Screen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
          title: Text(
            'Marketplace',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      readOnly: true,
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => SearchScreenMarket())),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search items",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 30,
              //   child: Row(
              //     children: [
              //       Text(
              //         "Categories",
              //         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 60,
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         maxRadius: 45,
              //         backgroundColor: Colors.lime,
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: marketProdList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetails(marketProdList[index]))),
                          child: Card(
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
                                Text(
                                    "${marketProdList[index]['Product Name']}"),
                                Text(
                                    "${marketProdList[index]['Product Description']}"),
                                Text(
                                    "${marketProdList[index]['Product Condition']}"),
                                Text(
                                    "${marketProdList[index]['Product Brand']}"),
                                Text(
                                    "RM${marketProdList[index]['Product Price']}")
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
            icon: Icons.add,
            backgroundColor: Colors.black,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.approval),
                label: 'Sell a Product',
                backgroundColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Addmarketproduct_screen()),
                  );
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.account_balance_wallet),
                label: 'Sell',
                backgroundColor: Colors.grey,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Admin()),
                //   );
                // },
              ),
            ]),
      ),
    );
  }
}
