import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  Widget _buildFeaturedProduct(String name, double price, String image) {
    return Card(
      child: Container(
        height: 250,
        width: 160,
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/$image"),
                ),
              ),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xff9b96d6)),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("MarketPlace"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.pink,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              // _key.currentState.openDrawer();
            }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.send), onPressed: () {}),
        ],
      ),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   margin: EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         height: 120,
      //         width: double.infinity,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: <Widget>[
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Text("Featured Items",
      //                     style: TextStyle(
      //                         fontSize: 17, fontWeight: FontWeight.bold)),
      //                 Text("See All",
      //                     style: TextStyle(
      //                         fontSize: 17, fontWeight: FontWeight.bold)),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //       Row(
      //           children: <Widget>[
      //             _buildFeaturedProduct(
      //                 image: "Computer.jpg",
      //                 price: 30.0,
      //                 name: "Computer Science Book"),
      //             _buildFeaturedProduct(
      //                 image: "Computer.jpg",
      //                 price: 30.0,
      //                 name: "Computer Science Book"),
      //           ],
      //           ),
      //     ],
      //   ),
      // ),
    );
  }
}
