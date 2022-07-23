import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wefiwebu_2/model/lostnfound_prod.dart';
import 'package:wefiwebu_2/model/user_model.dart';

class Addlostitem_screen extends StatefulWidget {
  @override
  State<Addlostitem_screen> createState() => _Addlostitem_screen();
}

class _Addlostitem_screen extends State<Addlostitem_screen> {
  TextEditingController Pname = TextEditingController();
  TextEditingController Pdescrip = TextEditingController();
  TextEditingController Plocat = TextEditingController();
  TextEditingController Prwrdprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future addLnfprod() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentuser = _auth.currentUser;
      CollectionReference collectRef =
          FirebaseFirestore.instance.collection('user-lostnfound');
      return collectRef
          .doc(currentuser!.uid)
          .collection('lnf-items')
          .doc()
          .set({
        'Product name': Pname.text,
        'Product descrip': Pdescrip.text,
        'Product location': Plocat.text,
        'Reward price': double.parse(Prwrdprice.text),
        'Notification': "Your lost & found item was listed successfully",
        'Date': FieldValue.serverTimestamp()
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Lost or Found "),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: Pname,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.abc_sharp),
                    hintText: "Product Name",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: Pdescrip,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Product Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: Plocat,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.maps_home_work),
                    hintText: "Last Location",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: Prwrdprice,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Your reward price is required");
                  }
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    hintText: "Reward Price",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20.0,
              ),
              // image upload
              Material(
                elevation: 2,
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  onPressed: () async {},
                  child: Text(
                    'Upload Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.pinkAccent,
                child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      addLnfprod();
                      Pname.clear();
                      Pdescrip.clear();
                      Plocat.clear();
                      Prwrdprice.clear();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Product Submitted'),
                            );
                          });
                    },
                    child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
