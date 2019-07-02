import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/StringData.dart';

class ScientificJournal extends StatefulWidget {
  @override
  _ScientificJournalState createState() => _ScientificJournalState();
}

class _ScientificJournalState extends State<ScientificJournal> {
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
          ///Text Tittle
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: new Text(StringData.scientific_journals_title,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 25.0,
                    color: ColorsData.colorAppTheme,
                    fontWeight: FontWeight.bold)),
          ),

          ///-------------------1
          ///Image
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: CachedNetworkImage(
                height: 180,
                width: 300,
                imageUrl:
                    'https://sugarwatchers.in/wp-content/uploads/2019/02/american-diabetes-association-01-logo-png-transparent.png',
                fit: BoxFit.contain,
              )),

          ///DETAIL Text2
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: new Text(StringData.scientific_journals_detail,
                style: new TextStyle(
                  fontSize: 15.0,
                  color: ColorsData.colorAppTheme,
                )),
          ),

          ///-------------------2
          ///Image
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: CachedNetworkImage(
                height: 180,
                width: 300,
                imageUrl:
                    'https://sugarwatchers.in/wp-content/uploads/2019/02/Canadian-Diabetes-Association-CDA.png',
                fit: BoxFit.contain,
              )),

          ///DETAIL Text2
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: new Text('Eating foods with a low Glycemic Index may help you to: \n'
                '- Control your blood glucose level\n'
                '- Control your cholesterol level\n'
                '- Control your appetite\n'
                '- Lower your risk of developing heart disease\n'
                '- Lower your risk of developing type 2 diabetes',
                style: new TextStyle(
                  fontSize: 15.0,
                  color: ColorsData.colorAppTheme,
                )),
          ),
          ///-------------------3
          ///Image
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: CachedNetworkImage(
                height: 180,
                width: 300,
                imageUrl:
                'https://sugarwatchers.in/wp-content/uploads/2019/02/Glycemic-Index-Foundation.png',
                fit: BoxFit.contain,
              )),

          ///DETAIL Text2
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: new Text('"If you need to lose weight and keep it off, incorporating low GI, higher protein foods into your diet can help you achieve this.  Foods with a low GI (GI ≤ 55) release glucose into the bloodstream at a slow sustainable rate, and have proven benefits for health"    Glycemic Index Foundation, Australia',
                style: new TextStyle(
                  fontSize: 15.0,
                  color: ColorsData.colorAppTheme,
                )),
          ),
        ]));
  }
}
