import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return mainContent();
  }

  Widget mainContent() {
    return Scaffold(
        backgroundColor: ColorsData.colorWhite,

        ///APPBAR
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(false)),
          title: Text(
            "Contact Us",
            style: TextStyle(color: ColorsData.colorWhite),
          ),
        ),

        ///BODY
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "WE WOULD LOVE TO HEAR FROM YOU",
                style: TextStyle(
                    fontSize: 25,
                    color: ColorsData.colorLoginTittle,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            ///IMAGE
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CachedNetworkImage(
                  imageUrl:  'https://sugarwatchers.in/wp-content/uploads/2019/01/SW_CF-e1547043546819.jpg',
                  fit: BoxFit.fill,
                  height: 300,
                )),

            ///Text
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Main infomation',
                  style: TextStyle(fontSize: 25, color: ColorsData.colorBlack),
                )),

            ///Text
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Address:  B-902, Ashok Gardens, Sewree, \n Mumbai – 400 015 \n Phone: +91 89282 79978 \n Mail: cc@sugarwatchers.in',
                  style: TextStyle(fontSize: 15),
                ))
          ],
        ));
  }
}
