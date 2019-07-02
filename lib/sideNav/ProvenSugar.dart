import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/StringData.dart';

class ProvenSugar extends StatefulWidget {
  @override
  _ProvenSugarState createState() => _ProvenSugarState();
}

class _ProvenSugarState extends State<ProvenSugar> {
  @override
  Widget build(BuildContext context) {
    return _mainView();
  }

  _mainView() {
    return Scaffold(
        backgroundColor: ColorsData.colorWhite,

        ///AppBar
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(false)),
          title: Text('Proven for Sugar Control'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              color: ColorsData.colorGreen,
              child: Column(
                children: <Widget>[
                  /// Image
                  Image.asset(
                    'images/home_sugar.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  ///TITLE  sugar_control_title Text
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: new Text(StringData.sugar_control_title,
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),

                  ///DETAIL sugar_control_title Text
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: new Text(StringData.sugar_control_detail,
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: ColorsData.colorBlack,
                        )),
                  ),

                  ///DETAIL Text2
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: new Text(StringData.sugar_control_detail2,
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: ColorsData.colorBlack,
                        )),
                  ),

                  ///TITLE  weight_control_title Text
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: new Text(StringData.weight_control_title,
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),

                  ///DETAIL weight_control_title Text
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: new Text(StringData.weight_control_detail2,
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: ColorsData.colorBlack,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
