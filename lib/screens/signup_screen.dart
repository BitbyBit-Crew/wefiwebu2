import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wefiwebu_2/Home_btmnavbar_screen.dart';
import 'package:wefiwebu_2/model/user_model.dart';
import 'package:wefiwebu_2/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final matricCon = new TextEditingController();
  final fullNameCon = new TextEditingController();
  final mobilePhCon = new TextEditingController();
  final emailCon = new TextEditingController();
  final passwordNameCon = new TextEditingController();
  final confirmationPassCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Matric Id field
    final matricfield = TextFormField(
      autofocus: false,
      controller: matricCon,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Full Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter a valid name (Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        matricCon.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.abc),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Matric ID",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //Full name field
    final fullNamefield = TextFormField(
      autofocus: false,
      controller: fullNameCon,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Full Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter a valid name (Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        fullNameCon.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Full Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //Mobile Number field
    final mobilefield = TextFormField(
      autofocus: false,
      controller: mobilePhCon,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Your mobile number is required");
        }
      },
      onSaved: (value) {
        mobilePhCon.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mobile_friendly),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mobile Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //email name field
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailCon,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailCon.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //password name field
    final passwordfield = TextFormField(
      autofocus: false,
      controller: passwordNameCon,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordNameCon.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //confirmation password field
    final confirmatationfield = TextFormField(
      autofocus: false,
      controller: confirmationPassCon,
      obscureText: true,
      validator: (value) {
        if (confirmationPassCon.text != passwordNameCon.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmationPassCon.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmation Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //Sign Up button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.pinkAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailCon.text, passwordNameCon.text);
          },
          child: Text(
            "Register ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        fit: BoxFit.contain,
                      )),
                  SizedBox(height: 45),
                  matricfield,
                  SizedBox(height: 25),
                  fullNamefield,
                  SizedBox(height: 25),
                  mobilefield,
                  SizedBox(height: 25),
                  emailfield,
                  SizedBox(height: 25),
                  passwordfield,
                  SizedBox(height: 25),
                  confirmatationfield,
                  SizedBox(height: 25),
                  signupButton,
                  SizedBox(height: 15),
                ]),
          ),
        ),
      ))),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.matric = matricCon.text;
    userModel.fullname = fullNameCon.text;
    userModel.mobilenum = mobilePhCon.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeBtmNavbar()),
        (route) => false);
  }
}
