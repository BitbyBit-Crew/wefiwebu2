import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserModel loggedInUser = UserModel();

    final df = new DateFormat('dd-MM-yyyy hh:mm a');

    int myvalue = 1658583128;

    return Scaffold(
      appBar: new AppBar(
        title: new Text("My Notification"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user-marketprod')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('market-items')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapnote) {
            return ListView.separated(
                itemCount: snapnote.data!.docs.length,
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.blueGrey,
                    ),
                itemBuilder: (_, index) {
                  DocumentSnapshot datasnap = snapnote.data!.docs[index];
                  return ListTile(
                    trailing: SizedBox(
                      width: 110.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [],
                      ),
                    ),

                    title: Text(datasnap['Notification']),

                    // subtitle: Text(datasnap['Date'].toString()),

                    subtitle: Text(df.format(
                        new DateTime.fromMillisecondsSinceEpoch(
                            myvalue * 1000))),

                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => ViewScreen(datasnap))),
                    // onLongPress: () {},
                  );
                });
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // children: [
        //   FloatingActionButton(
        //       heroTag: "btn1",
        //       child: const Icon(Icons.menu),
        //       tooltip: 'Show less. Hide notes content',
        //       onPressed: () => {}),

        //   // /* Notes: for the "Show More" icon use: Icons.menu */

        //   FloatingActionButton(
        //     heroTag: "btn2",
        //     child: const Icon(Icons.add),
        //     tooltip: 'Add a new note',
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => AddScreen()));
        //     },
        //   ),
        // ],
      ),
    );
  }
}
