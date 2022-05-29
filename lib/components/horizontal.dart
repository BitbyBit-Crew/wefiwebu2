// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/books.png',
            image_caption: 'Books',
          ),
          Category(
            image_location: 'assets/images/laptop.png',
            image_caption: 'Electronics',
          ),
          Category(
            image_location: 'assets/images/shoe.png',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'assets/images/dress.png',
            image_caption: 'Dress',
          ),
          Category(
            image_location: 'assets/images/shirt.png',
            image_caption: 'Shirt',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({required this.image_location, required this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 60.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption),
              )),
        ),
      ),
    );
  }
}
