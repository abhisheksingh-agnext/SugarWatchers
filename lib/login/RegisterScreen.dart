import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/StringData.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username;
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.colorWhite,
        resizeToAvoidBottomPadding:false,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsData.colorWhite),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          title: Text(StringData.register)),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        /// LogoImage 30
        Flexible(child: logo(), flex: 30, fit: FlexFit.loose),

        /// Form 40
        Flexible(child: registerForm(), flex: 40, fit: FlexFit.loose),

        ///Register Button 10
        Flexible(child: registerButton(), flex: 10, fit: FlexFit.loose),
        /// Space 20
        Spacer(flex:20)
      ]),
    );
  }

  ///Logo Image
  Widget logo() {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Hero(
          tag: "SplashHero",
          child: CachedNetworkImage(
            imageUrl:
                'https://sugarwatchers.in/wp-content/uploads/2018/11/293X155.png',
            fit: BoxFit.contain,
            height: 80,
            width: 120,
          ),
        ));
  }

  ///Register Form
  Widget registerForm() {
    return new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: new TextFormField(
              style: TextStyle(color: ColorsData.colorText),
              onSaved: (val) => _username = val,
              validator: (val) {
                return val.length < 8
                    ? "Username must have atleast 8 chars"
                    : null;
              },
              decoration: new InputDecoration(
                  labelText: StringData.email_address,
                  labelStyle: TextStyle(color: ColorsData.colorBlack),
                  enabledBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: ColorsData.colorText))),
            ),
          ),
        ],
      ),
    );
  }

  ///Register Button
  Widget registerButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: RaisedButton(
          elevation: 0.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          padding:
              EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0, left: 7.0),
          onPressed: () {
//                        Navigator.of(context).pushReplacementNamed(VIDEO_SPALSH);
          },
          child: Center(
            child: Text(
              'Register',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          textColor: ColorsData.colorWhite,
          color: ColorsData.colorAppTheme,
        ));
  }
}
