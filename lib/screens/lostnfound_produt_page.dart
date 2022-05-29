import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LnfProductPage extends StatefulWidget {
  var lnfproduct;
  LnfProductPage(this.lnfproduct);
  @override
  State<LnfProductPage> createState() => _LnfProductPageState();
}

class _LnfProductPageState extends State<LnfProductPage> {
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.lnfproduct['Prod name']),
            Text(widget.lnfproduct['Prod description']),
            Text(widget.lnfproduct['Prod last location']),
            Text(widget.lnfproduct['Reward price'].toString()),
            SizedBox(
              width: 10,
              height: 56,
            )
          ],
        ),
      )),
    );
  }
}
