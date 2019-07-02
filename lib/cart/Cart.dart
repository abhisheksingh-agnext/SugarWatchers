import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/constants.dart';

import 'CheckOutScreen.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return _mainContent();
  }

  _mainContent() {
    return Scaffold(
      backgroundColor: ColorsData.colorWhite,

      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
            {
            Navigator.of(context).pop(false)
            }),
        title: Text('Cart'),
      ),
      body: ListView(
          children: <Widget>[
      ///Image
      Padding(
      padding: const EdgeInsets.all(32),
      child: Image.asset(
          'images/product1.png', height: 150, fit: BoxFit.contain),
    ),

    ///--------------------Text 1
    Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 16),
      child: Row(
      children: <Widget>[
      Expanded(
      child: Text(
      'Product :',
      style: TextStyle( color: ColorsData.colorText ,fontSize: 20),
      )),

      Expanded(
      child: Text(
      'Low GI Rice',
      textAlign: TextAlign.end,
      style: TextStyle(color: ColorsData.colorBlack ,fontSize: 20),
      )),
      ],
      ),
    ),
    ///---------------------Text 2
    Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 16),
      child: Row(
      children: <Widget>[
     Expanded(
      child: Text(
      'Price :',
      style: TextStyle(
       color: ColorsData.colorText,fontSize: 20),
      )),
     Expanded(
      child: Text(
      '₹ 89.00',
        textAlign: TextAlign.end,
        style: TextStyle(color: ColorsData.colorBlack,fontSize: 20),
      )),


      ],
      ),
    ),

      ///---------------------Text 3
      Padding(
        padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 16),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
                  'Quantity :',
                  style: TextStyle(
                      color: ColorsData.colorText,fontSize: 20),
                )),
            Expanded(
                child: Text(
                  '${Constants.Quantity}',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: ColorsData.colorBlack,fontSize: 20),
                )),
          ],
        ),
      ),

      ///---------------------Text 4
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Divider(),
      ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Cart Totals',style: TextStyle(color: ColorsData.colorBlack,fontSize: 20),),
            ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 16),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
                  'Total :',
                  style: TextStyle(
                      color: ColorsData.colorText,fontSize: 20),
                )),
            Expanded(
                child: Text(
                  '₹ ${Constants.Quantity*89}',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: ColorsData.colorBlack,fontSize: 25,fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),

      ///RaisedButton CheckOut
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CheckOutScreen()));
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Proceed to  Checkout',
                style: TextStyle(fontSize: 15),
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
