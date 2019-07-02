import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/StringData.dart';

class RecommandByExpert extends StatefulWidget {
  @override
  _RecommandByExpertState createState() => _RecommandByExpertState();
}

class _RecommandByExpertState extends State<RecommandByExpert> {
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
    body:
      ListView(children: <Widget>[
      ///Image
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: CachedNetworkImage(
            imageUrl: 'https://sugarwatchers.in/wp-content/uploads/2019/02/Sugar-Watchers-Stickers.jpg',
            fit: BoxFit.contain,
          )),
      ///Text Tittle
      Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: new Text(StringData.medical_experts_title,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 25.0,
                color: ColorsData.colorAppTheme,
                fontWeight: FontWeight.bold)),
      ),

      ///DETAIL Text2
      Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: new Text(StringData.medical_experts_detail,
            style: new TextStyle(
              fontSize: 15.0,
              color: ColorsData.colorAppTheme,
            )),
      ),
    ]));
  }
}
