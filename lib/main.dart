import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/constants.dart';
import 'login/LoginUser.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: ColorsData.colorWhite,
          primarySwatch: ColorsData.primary,
          fontFamily: 'Regular'),
      home: new SplashScreen(),
    );
  }
}

/// Splash screen
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(54.0),

          child: Hero(tag: "SplashHero", child:
          CachedNetworkImage(
            imageUrl:
                'https://sugarwatchers.in/wp-content/uploads/2018/11/293X155.png',
            fit: BoxFit.contain,
            height: 60,
            width: 120,
          ),)
        ));
  }

  startTime() async {
    var _duration = new Duration(seconds: Constants.SPLASH_TIMER);
    return new Timer(_duration, navigationPage);
  }

  navigationPage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginUser()));
  }
}
