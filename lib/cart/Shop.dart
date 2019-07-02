import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/cart/ProductDetail.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  var androidVersionNames = List<Product>();

  @override
  Widget build(BuildContext context) {
    androidVersionNames
        .add(new Product("images/product1.png", "Low GI Rice", "89.00"));
    androidVersionNames
        .add(new Product("images/product2.png", "Low GI Rice(5kg)", "440.00"));
    androidVersionNames.add(
        new Product("images/product3.png", "Low GI 7 Grain Atta", "89.00"));
    androidVersionNames.add(new Product(
        "images/product4.png", "Low GI 7 Grain Atta(5kg)", "440.00"));
    androidVersionNames
        .add(new Product("images/product5.png", "Low GI Poha", "59.00"));

    return Scaffold(
      ///APPBAR
      backgroundColor: ColorsData.colorWhite,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorsData.colorWhite,
            ),
            onPressed: () => Navigator.of(context).pop(false)),
        title: Text("Cart"),
      ),

      ///BODY
      body: ListView.builder(
        itemBuilder: (context, position) {
          return

              ///Card
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
              onTap: () => moveToProductDetail(context, position),
              child: Card(
                  child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Spacer(),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: ColorsData.colorText,
                              ),
                              onPressed: () {})),
                    ],
                  ),

                  ///IMAGE SLIDER
                  imageSlider(),

                  ///TEXT PRODUCT NAME
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      androidVersionNames[position].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, color: ColorsData.colorText),
                    ),
                  ),

                  ///TEXT PRODUCT PRICE
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text("₹" + androidVersionNames[position].price,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, color: ColorsData.colorBlack)),
                  ),
                ],
              )),
            ),
          );
        },
        itemCount: androidVersionNames.length,
      ),
    );
  }

  ///Product Click Method
  moveToProductDetail(BuildContext context, int position) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProductDetail(product: androidVersionNames[position])));
  }
}

final List<String> imgList = [
//  'images/product1.png',
//  'images/product2.png',
//  'images/product3.png',
//  'images/product4.png'
  'https://sugarwatchers.in/wp-content/uploads/2018/11/Poha-1kg-Back.jpg',
  'https://sugarwatchers.in/wp-content/uploads/2018/11/Atta-1kg-Back.jpg'
//  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(
            i,
            fit: BoxFit.contain,
            width: 1000.0,
            height: 2000,
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

/*TODO IMAGE SLIDER
///IMAGE SLIDER
///RIGHT ARROW*/
Widget imageSlider() {
//      RaisedButton(child: Text("hello"),),
  final basicSlider = CarouselSlider(
    items: child,
    height: 200,
  );
  return Row(children: [
    ///LEFT ARROW
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: ColorsData.colorAppTheme,
            ),
            onPressed: () => basicSlider.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear))),

    ///IMAGE SLIDER
    Expanded(flex: 2, child: basicSlider),

    ///RIGHT ARROW
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: ColorsData.colorAppTheme,
            ),
            onPressed: () => basicSlider.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear))),
  ]);
}

class Product {
  String name;
  String id;
  String price;

  Product(this.id, this.name, this.price);
}
