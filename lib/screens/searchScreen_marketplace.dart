import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wefiwebu_2/screens/product_details.dart';

class SearchScreenMarket extends StatefulWidget {
  @override
  State<SearchScreenMarket> createState() => _SearchScreenMarketState();
}

class _SearchScreenMarketState extends State<SearchScreenMarket> {
  List marketProdList = [];
  var inputText = "";

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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                setState(() {
                  inputText = value;
                  print(inputText);
                });
              },
            ),
            Expanded(
                child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("marketplace")
                      .where(
                        'Product Name',
                        isGreaterThanOrEqualTo: inputText,
                      )
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Something went wrong"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;

                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProductDetails(data))),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              title: Text(data['Product Name']),
                              leading: CircleAvatar(
                                  child:
                                      Image.asset("assets/images/avatar.png")),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ))
          ],
        ),
      )),
    );
  }
}
