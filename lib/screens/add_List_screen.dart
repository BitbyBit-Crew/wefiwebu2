import 'package:flutter/material.dart';

class Addlistscreen extends StatefulWidget {
  @override
  State<Addlistscreen> createState() => _AddlistscreenState();
}

class _AddlistscreenState extends State<Addlistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Add list Page"),
      ),
    );
  }
}
