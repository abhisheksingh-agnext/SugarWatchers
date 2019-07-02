import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/homeScreen/HomeScreen.dart';
import 'package:sugar_watchers/utils/StringData.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';

import 'RegisterScreen.dart';

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  String _username, _password;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.colorWhite,
      resizeToAvoidBottomPadding:false,

      appBar: AppBar(
        title: Text(StringData.login),
      ),
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              ///Logo Image 30
              Flexible(    child: logo(),         flex: 30              ),

              ///Form View 40
              Flexible(child: loginForm(), flex: 40),

              ///RaisedButton Login  10
              Flexible(   child: loginButton(),    flex: 10,            ),

              /// MaterialButton (Register) 10
              Flexible(  child: registerButton(),    flex: 10,          ),

              /// MaterialButton (SKIP LOGIN) 10
              Flexible(     child: skipLogin(),     flex:10)           ],
          ),
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

  ///Form View
  Widget loginForm() {
    return /**Form(UserName,Password,Login Button )*/
      new Form(
        key: formKey,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 20),

              /**TextFormField UserName*/
              child: new TextFormField(
                style: TextStyle(color: ColorsData.colorText),
                onSaved: (val) => _username = val,
                validator: (val) {
                  return val.length < 8
                      ? "Username must have atleast 8 chars"
                      : null;
                },
                decoration: new InputDecoration(
                    labelText: StringData.userName,
                    labelStyle: TextStyle(color: ColorsData.colorBlack),
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: ColorsData.colorText))),
              ),
            ),

            /**TextFormField Password*/
            new Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 20),
              child: new TextFormField(
                obscureText: true,
                style: TextStyle(color: ColorsData.colorText),
                onSaved: (val) => _password = val,
                decoration: new InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: ColorsData.colorBlack),
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: ColorsData.colorText))),
              ),
            ),
          ],
        ),
      );
  }

  /// RaisedButton Login
  Widget loginButton() {
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
              'Login',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          textColor: ColorsData.colorWhite,
          color: ColorsData.colorAppTheme,
        ));
  }

  ///RegisterButton
  Widget registerButton() {
    return new MaterialButton(
        onPressed: onClickMoveRegister,
        child: Text(
          "Are you new User ?",
          style: TextStyle(
              color: ColorsData.colorAppTheme,
              decoration: TextDecoration.underline,
              fontSize: 15),
        ));
  }

  /// MaterialButton (SKIP LOGIN)
  Widget skipLogin() {
    return Row(children: [
      Spacer(),
      new MaterialButton(
          onPressed: onClickMoveHome,
          child: Text(
            "Skip login",
            style: TextStyle(
                color: ColorsData.colorText,
                decoration: TextDecoration.underline,
                fontSize: 15),
          ))
    ]);
  }

  ///Navigator  to move
  void onClickMoveRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  void onClickMoveHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
