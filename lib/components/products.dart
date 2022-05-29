import 'package:flutter/material.dart';
import 'package:wefiwebu_2/screens/product_details.dart';
import 'package:wefiwebu_2/screens/product_details.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_List = [
    {
      "name": "Blazer",
      "picture": 'assets/images/blazer.png',
      "price": 80,
    },
    {
      "name": "Formal Shoe",
      "picture": 'assets/images/blackshoe.png',
      "price": 50,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_List.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_List[index]['name'],
            prod_picture: product_List[index]['picture'],
            prod_price: product_List[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;

  Single_prod({
    required this.prod_name,
    required this.prod_picture,
    required this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                //here we are passing the value of the product to the product details page
                builder: (context) => new ProductDetails(
                      product_detail_name: prod_name,
                      product_detail_picture: prod_picture,
                      product_detail_price: prod_price,
                    ))),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      prod_name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "\RM$prod_price",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),

                    // subtitle: Text(
                    //   "\$$prod_price",
                    //   style: TextStyle(
                    //     color: Colors.red, fontWeight: FontWeight.w800,
                    // decoration: TextDecoration.lineThrough),
                    //   ),
                    // ),
                  ),
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
