import 'package:wefiwebu_2/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final UserModel sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;


  Message({
    required this.sender,
    required this.time,
    required this.text,
  });


Map<String, dynamic> toMap(){
  return {
    'sender' : sender,
    'time' :  time,
    'text': text,
  };
}
}
