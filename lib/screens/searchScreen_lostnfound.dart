import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
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
                      .collection("lostnfound")
                      .where('Prod name', isGreaterThanOrEqualTo: inputText)
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
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(data['Prod name']),
                            leading: CircleAvatar(
                                child: Image.asset("assets/images/avatar.png")),
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
