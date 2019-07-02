import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:toast/toast.dart';

import 'Cart.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var _firstName = '',
      _secName = '',
      _country = '',
      _address = '',
      _state = '',
      _postPin = '',
      _phone = '',
      _email = '';
  final formKey = new GlobalKey<FormState>();

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
              onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Cart()))
                  }),
          title: Text('Checkout')),
      body: new Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                /// Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Billing details',
                    style: TextStyle(
                        color: ColorsData.colorAppTheme, fontSize: 20),
                  ),
                ),

                /// TextFormField 1
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: 'First name'),
                      onSaved: (val) => _firstName = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }),
                ),

                /// TextFormField 2
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Last name'),
                    onSaved: (val) => _secName = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

                /// TextFormField 3
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Country'),
                    onSaved: (val) => _country = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

                /// TextFormField 4
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Street address'),
                    onSaved: (val) => _address = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

                /// TextFormField 5
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'State'),
                    onSaved: (val) => _state = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

//            /// TextFormField 6
//            Padding(
//              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//              child: TextFormField(
//                decoration: InputDecoration(labelText: 'Sta'),
//                onSaved: (val) => _state = val,
//
//              ),
//            ),

                /// TextFormField 7
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Postcode/ZIP'),
                    onSaved: (val) => _postPin = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

                /// TextFormField 8
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Phone '),
                    onSaved: (val) => _phone = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

                /// TextFormField 8
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (val) => _email = val,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      }
                  ),
                ),

                /// Text
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Text(
                    'Additional information',
                    style:
                        TextStyle(color: ColorsData.colorBlack, fontSize: 20),
                  ),
                ),

                /// TextFormField 8
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:
                        InputDecoration(labelText: 'Order notes(Optional)'),
                  ),
                ),

                ///Row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.adjust),
                      Text('Cash on delivery')
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Text('Pay with cash upon delivery'),
                ),

                ///RaisedButton CheckOut
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: RaisedButton(
                    onPressed: () {
//                  _address='',_state='',_postPin='',_phone='',_email=''
//                  if (_firstName.isEmpty &&
//                      _secName.isEmpty &&
//                      _country.isEmpty&&
//                      _address.isEmpty &&
//                      _state.isEmpty &&
//                      _postPin.isEmpty&&
//                      _phone.isEmpty &&
//                      _email.isEmpty
//                  )

                      if (formKey.currentState.validate()) {
                        Toast.show("Order successfully placed", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                        Navigator.of(context).pop();
                      } else {
                        Toast.show("Fill a field", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
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
          )),
    );
  }
}
