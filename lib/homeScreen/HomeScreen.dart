import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/cart/Cart.dart';
import 'package:sugar_watchers/cart/Shop.dart';
import 'package:sugar_watchers/login/LoginUser.dart';
import 'package:sugar_watchers/sideNav/AboutUs.dart';
import 'package:sugar_watchers/sideNav/ContactUs.dart';
import 'package:sugar_watchers/sideNav/FAQ.dart';
import 'package:sugar_watchers/sideNav/NearByStore.dart';
import 'package:sugar_watchers/sideNav/ProvenSugar.dart';
import 'package:sugar_watchers/sideNav/RecommandByExpert.dart';
import 'package:sugar_watchers/sideNav/ScientificJournal.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:sugar_watchers/utils/StringData.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: ColorsData.primary,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override

  ///AppBar
  ///2 Side Nav
  ///3 Body
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.colorWhite,
      ///AppBar
      appBar: AppBar(title: Text(StringData.app_name), actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(choices[0].icon),
          onPressed: () {
            _select(choices[0]);
          },
        ),
        // action button
        IconButton(
          icon: Icon(choices[1].icon),
          onPressed: () {
            _select(choices[1]);
          },
        ),
      ]),

      /// Side Nav
      drawer:  _sideNavigation(),

      ///Body
      body: _homeBody(),
    );
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://sugarwatchers.in/wp-content/uploads/2019/01/SUGAR-WATCHERS-LOW-GI.mp4',
    );

    // Initialize the controller and store the Future for later use
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video
    _controller.setLooping(true);
    _controller.setVolume(00);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    // Ensure you dispose the VideoPlayerController to free up resources
    _controller.dispose();

    super.dispose();
  }

  ///Home Page Content
  _homeBody() {
    final List<String> imgList = [
      'images/home_slide.png',
      'images/home_slide2.png',
      'images/home_slide3.png'
    ];
    return (ListView(
      children: <Widget>[
        ///Auto playing carousel
        CarouselSlider(
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          autoPlay: true,
          enlargeCenterPage: true,
          items: imgList.map(
            (url) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
              );
            },
          ).toList(),
        ),

        ///TITLE Text
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: new Text(StringData.home_title,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold)),
        ),

        ///DETAIL Text
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: new Text(StringData.home_body,
              style: new TextStyle(
                fontSize: 15.0,
                color: ColorsData.colorAppTheme,
              )),
        ),

        /// VideoPlayer
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the Aspect Ratio of the Video
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner
              return Center(child: CircularProgressIndicator());
            }
          },
        ),

        ///Text
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              'The technical measure for the rate at which our body breaks down carbs and releases them in our blood as sugar, is called as Glycemic Index (GI). Foods with a GI below 55 are Low-GI Foods.',
              style: TextStyle(
                fontSize: 15,
                color: ColorsData.colorAppTheme,
              ),
            )),





        ///---------------------------------------Section
        ///Text Tittle

      ],
    ));
  }

  ///Side Navigation
  _sideNavigation()
  {
    return
      Drawer(
        child:
      ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            children: <Widget>[

              /// CachedNetworkImage
              CachedNetworkImage(
                imageUrl:
                ' ',
                fit: BoxFit.cover,
                height: 100,
                color: ColorsData.colorWhite,
              )
            ],
          ),
          decoration: BoxDecoration(
            color: ColorsData.colorAppTheme,
          ),
        ),
        ListTile(
          title: Text(
            'LOW GI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.ac_unit,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),

        ListTile(
          title: Text(
            'Proven for Sugar Control',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.ac_unit,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProvenSugar()));
          },
        ),


        ListTile(
          title: Text(
            'Recommended by Medical Expert',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.ac_unit,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecommandByExpert()));
          },
        ),

        ListTile(
          title: Text(
            'Scentific Journal on Low GI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.ac_unit,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScientificJournal()));
          },
        ),
        ListTile(
          title: Text(
            'Shop',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.add_shopping_cart,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Shop()));
          },
        ),
        ListTile(
          title: Text(
            'Find a Store',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.account_balance,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NearByStore()));
          },
        ),
        ListTile(
          title: Text(
            'FAQ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.assignment,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FAQ()));
          },
        ),
        ListTile(
          title: Text(
            'About us',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.business_center,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutUs()));
          },
        ),

        ListTile(
          title: Text(
            'Contact us',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.call,
            color: ColorsData.colorAppTheme,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUs()));
          },
        ),
      ],)
    );
  }


  ///AppBar button data
  static const List<Choice> choices = const <Choice>[
    const Choice(id: 1, title: 'User', icon: Icons.account_circle),
    const Choice(id: 2, title: 'Cart', icon: Icons.add_shopping_cart),
  ];

  void _select(Choice choice) {
    switch (choice.id) {
      case 1:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginUser()));
        }
        break;

      case 2:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        }
        break;
    }
  }
}

///Login Check

///Pojo
class Choice {
  const Choice({this.id, this.title, this.icon});

  final int id;
  final String title;
  final IconData icon;
}
