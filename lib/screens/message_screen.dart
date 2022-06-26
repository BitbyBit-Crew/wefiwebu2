import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


class MessageScreen extends StatefulWidget {
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  
 final fcmToken = FirebaseMessaging.instance.getToken();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        title: Text(
          'Messages',
          style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
    
    );
  }
}
