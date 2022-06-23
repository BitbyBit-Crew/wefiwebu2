import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wefiwebu_2/model/lostnfound_prod.dart';
import 'package:wefiwebu_2/model/user_model.dart';

class Editlostitem_screen extends StatefulWidget {
  final lnfproduct;
  Editlostitem_screen(this.lnfproduct);
  @override
  State<Editlostitem_screen> createState() => _Addlostitem_screen();
}

class _Addlostitem_screen extends State<Editlostitem_screen> {
  TextEditingController Pname = new TextEditingController();
  TextEditingController Pdescrip = new TextEditingController();
  TextEditingController Plocat = new TextEditingController();
  TextEditingController Prwrdprice = new TextEditingController();

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
                    labelText: "${widget.lnfproduct['Prod name']}",
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
                    labelText: "${widget.lnfproduct['Prod description']}",
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
                    labelText: "${widget.lnfproduct['Prod last location']}",
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
                    labelText: "${widget.lnfproduct['Reward price']}",
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
                      // final prod = LostnfoundData(
                      //     name: Pname.text,
                      //     descrip: Pdescrip.text,
                      //     lastlocation: Plocat.text,
                      //     price: double.parse(Prwrdprice.text),
                      //     owner: UserModel().uid.toString());

                      // updatelnfprod(prod);

                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         content: Text('Product Updatted'),
                      //       );
                      //     });
                    },
                    child: Text(
                      "Update",
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
