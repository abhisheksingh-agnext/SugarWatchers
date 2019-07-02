import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/constants.dart';
import 'package:toast/toast.dart';

import 'Shop.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState(product);
}

class _ProductDetailState extends State<ProductDetail> {
  Product product;
  var wish = false;
  var quantity = 1;

  _ProductDetailState(this.product);

//  _ProductDetailState({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainContent(product);
  }

  Widget mainContent(Product product) {
    return Scaffold(
      backgroundColor: ColorsData.colorWhite,

      ///APPBAR
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          title: Text(product.name)),

      ///BODY
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: ColorsData.colorBlack,
                      ),
                      onPressed: () => {
                            setState(() {
                              if (wish) {
                                wish = false;
                              } else {
                                wish = true;
                              }
                            })
                          })),
            ],
          ),

          ///Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl:
                  'https://sugarwatchers.in/wp-content/uploads/2018/11/Poha-1kg-Back.jpg',
              fit: BoxFit.cover,
              height: 250,
            ),
          ),

          ///Text Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(
                  fontSize: 25,
                  color: ColorsData.colorBlack,
                  fontWeight: FontWeight.bold),
            ),
          ),

          ///Text Price
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '₹ ${product.price}',
              style: TextStyle(fontSize: 20, color: ColorsData.colorBlack),
            ),
          ),

          ///Text Product Detail
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '  Sugar Watchers Low GI Rice is a natural yet scientifically produced product that is suitable for diabetics and aids in sugar &amp; weight management. Rice taste exactly like your regular non-basmati rice and the full family will feel the difference.',
                style:
                    TextStyle(fontSize: 15, color: ColorsData.colorGreyLight),
              )),

          /// Quantity
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal:8.0),
//            child: Text(
//              'Quantity',
//              textAlign: TextAlign.right,
//              style: TextStyle(fontSize: 20, color: ColorsData.colorBlack),
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Quantity',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 20, color: ColorsData.colorBlack),
                ),
                IconButton(
                    icon: Icon(Icons.remove_circle),
                    color: ColorsData.colorAppTheme,
                    onPressed: () => {
                          setState(
                            () {
                              if (quantity > 1) {
                                quantity = quantity - 1;
                              } else {
                                Toast.show("Minimum limit required", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              }
                            },
                          )
                        }),
                Text('$quantity'),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: ColorsData.colorAppTheme,
                  onPressed: () => {
                        setState(() {
                          if (quantity < 5) {
                            quantity = quantity + 1;
                          } else {
                            Toast.show("Maximum limit exceed", context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM);
                          }
                        })
                      },
                ),
              ],
            ),
          ),

          /// RaisedButton Add to Cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: RaisedButton(
              onPressed: () {
                Toast.show("Product is added", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                Constants.Quantity=quantity;
                Navigator.of(context).pop();
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: ColorsData.colorWhite,
                  ),
                  Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              textColor: ColorsData.colorWhite,
              color: ColorsData.colorAppTheme,
            ),
          ),

          ///RaisedButton Monthly subscription
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: RaisedButton(
              onPressed: () {
                Toast.show("Monthly subscription is activated", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                Navigator.of(context).pop();

              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Subscribe',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '(Deliver TO Me Every Month)',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              textColor: ColorsData.colorWhite,
              color: ColorsData.colorAppTheme,
            ),
          ),
        ],
      ),
    );
  }
}
