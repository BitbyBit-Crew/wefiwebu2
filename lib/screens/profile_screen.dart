import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wefiwebu_2/Home_btmnavbar_screen.dart';
import 'package:wefiwebu_2/screens/home_screen.dart';
import 'package:wefiwebu_2/screens/profileupdate_screen.dart';
import 'package:wefiwebu_2/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wefiwebu_2/model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
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
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

 
  @override
  Widget build(BuildContext context) {
    //display matric field
    final matricfield = TextFormField(
      readOnly: true,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.abc),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${loggedInUser.matric}",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //display Full name field
    final fullNamefield = TextFormField(
      readOnly: true,
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${loggedInUser.fullname}",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //display email field
    final emailfield = TextFormField(
      readOnly: true,
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${loggedInUser.email}",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //display phone number
    final mobilefield = TextFormField(
      readOnly: true,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mobile_friendly),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${loggedInUser.mobilenum}",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomeBtmNavbar ()));
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/avatar.png')
                                )),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.pinkAccent,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(height: 25),
                matricfield,
                SizedBox(height: 25),
                fullNamefield,
                SizedBox(height: 25),
                mobilefield,
                SizedBox(height: 25),
                emailfield,
                SizedBox(height: 25,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProfileUpdateScreen()));
                  },
                  color: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      logout(context);
                    },
                    child: const Text("Logout",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.black)),
                    ),
              ],
              ),
            ],    
               
            )),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SigInScreen()));
  }
}
