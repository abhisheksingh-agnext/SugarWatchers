import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'dart:math';


class NearByStore extends StatefulWidget {
  @override
  _NearByStoreState createState() => _NearByStoreState();
}

class _NearByStoreState extends State<NearByStore> {
   double currentLocationLat=0;
   double currentLocationLong=0;
  @override
  Widget build(BuildContext context) {
    return mainContent();
  }


   @override
   void initState() {
     for (var i = 0; i < 11; i++) {
      _add();
     }
   } //  current()
//  {
//    var location = new Location();
//
//    location.onLocationChanged().listen((LocationData currentLocation) {
//      currentLocationLat=currentLocation.latitude;
//      currentLocationLong=currentLocation.latitude;
//    });
//
//    CameraPosition(
//        bearing: 192.8334901395799,
//        target: LatLng(currentLocationLat, currentLocationLong),
//        tilt: 59.440717697143555,
//        zoom: 19.151926040649414);
//  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.0760,  72.8777),
    zoom: 10,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(19.0760,  72.8777),
      tilt: 59.440717697143555,
      zoom: 10);

  ///Main Content
  Widget mainContent()
  {
    return new Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=>Navigator.of(context).pop(false)),
      title: Text("Store",),
      actions: <Widget>[IconButton(icon:Icon(Icons.control_point),onPressed: ()=>_Filter(),)],),
      body:
      GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Go to Store!'),
        icon: Icon(Icons.gps_fixed),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }



///Add markers in MAp
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  int _markerIdCounter = 1;
  static final LatLng center = const LatLng(19.0760,  72.8777);

     void _add() {
    final int markerCount = markers.length;
    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'Store $_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        center.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
        center.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
//        _onMarkerTapped(markerId);
      },
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  ///Filter to apply to store
  Future<void>  _Filter() async {
//  String dropdownValue = 'One';
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Find near by store'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                /// Text Tittle
                Text('Find near by store'),
                /// DropdownButton
//                DropdownButton<String>(
//                  value: dropdownValue,
//                  onChanged: (String newValue) {
//                    setState(() {
//                      dropdownValue = newValue;
//                    });
//                  },
//                  items: <String>['One', 'Two', 'Free', 'Four']
//                      .map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value),
//                    );
//                  }).toList(),
//                ),


              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Apply'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
//            FlatButton(
//              child: Text('Cancel'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
          ],
        );
      },
    );
  }

}
