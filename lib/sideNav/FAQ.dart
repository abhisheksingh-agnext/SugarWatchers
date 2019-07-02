import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return mainContent();
  }

  Widget mainContent() {
    return Scaffold(
      backgroundColor: ColorsData.colorWhite,

      ///AppBar
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false)),
        title: Text('FAQ'),
      ),

      ///Body
      body: ListView(
        children: <Widget>[
          ///Card Question 1
          Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 4),
              child: Card(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                    "Question:- Do Sugar Watchers products have any artificial ingredients? Are they genetically modified?                  ",
                    style: TextStyle(
                        color: ColorsData.colorAppTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8),
                  child: Text(
                    "Answer:- No. Sugar Watchers products are not genetically modified. They are 100% natural.",
                    style: TextStyle(
                        color: ColorsData.colorBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )],),
              )


          ),
          ///Card Question 2
          Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 4),
              child: Card(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                      "Question:- Do Sugar Watchers products have to be consumed by Diabetics/ Pre-diabetics only?                  ",
                      style: TextStyle(
                          color: ColorsData.colorAppTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                      "Answer:- No, SW Low GI products are good for overall wellness of the whole family.  They can be consumed by anyone as they help in sugar control, weight management and general health.",
                      style: TextStyle(
                          color: ColorsData.colorBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )],),
              )


          ),
          ///Card Question 3
          Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 4),
              child: Card(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                      "Question:- Can the whole family consume Sugar Watchers products?                  ",
                      style: TextStyle(
                          color: ColorsData.colorAppTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                      "Answer:- Yes, it is highly recommended that your full family shifts to a low GI diet as it helps in sugar control and weight management. As Sugar Watchers products are 100% natural and taste like your regular rice, chapatis and poha, your family is unlikely to even notice a change.",
                      style: TextStyle(
                          color: ColorsData.colorBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )],),
              )


          ),
          ///Card Question 4
          Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 4),
              child: Card(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                      "Question:- Is there a special way of cooking Sugar Watchers products?                  ",
                      style: TextStyle(
                          color: ColorsData.colorAppTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                      "Answer:- No, Sugar Watchers rice, atta and poha should be cooked the same way you make your normal rice, chapatis and poha.",
                      style: TextStyle(
                          color: ColorsData.colorBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )],),
              )


          ),
        ],
      ),
    );
  }
}
