import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_watchers/utils/ColorsData.dart';
import 'package:video_player/video_player.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return mainContent();
  }

  Widget mainContent() {

    VideoPlayerController _controller;
    Future<void> _initializeVideoPlayerFuture;

    return Scaffold(
        backgroundColor: ColorsData.colorWhite,

        ///AppBar
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(false)),
          title: Text('About Us'),
        ),

        ///BOdy
        body: ListView(
          children: <Widget>[
            /// Text 1
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "About Sugar Watchers",
                style: TextStyle(
                    fontSize: 25,
                    color: ColorsData.colorAppTheme,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ),

            /// Text 2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "India is the diabetic capital of the world, -with approximately 6% of the population being diabetic and 1 in 3 Indians being pre-diabetic. Inspired by a personal tragedy when the mother of one of our founders was diagnosed with diabetes, we felt we needed to do something to help change this. After intensive research we found that one of the major reasons for diabetes was the Indian diet. And to make a major impact we had to address the problem at the center of the plate. Hence in 2018, we came together to develop and market Sugar Watchers, a brand of Low GI staples.",
                style: TextStyle(fontSize: 15),
              ),
            ),

            /// Text 3
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Our Team",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 25,
                    color: ColorsData.colorAppTheme,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ),

            /// Text 3
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Mangment Team",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: ColorsData.colorAppTheme),
              ),
            ),

            ///Card Team Member 1
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      /// Image
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://sugarwatchers.in/wp-content/uploads/2018/12/Arvind-Sharma-150x150.png',
                            fit: BoxFit.contain,
                            width: 150.0,
                            height: 150,
                          )),

                      ///Text Name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Arvind Sharma",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, color: ColorsData.colorAppTheme),
                        ),
                      ),

                      ///Text Position
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Chairman",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorsData.colorAppTheme,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      ///Text About
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "A marketing, branding &amp; communications expert, Arvind Sharma is former member of the Global Leadership Council of Leo Burnett Worldwide and Chairman &amp; CEO of its South Asia operations. He has been closely associated with many foods brands like Pillsbury, Coca-Cola, Complan, Heinz, Maaza, Glucon-D, Thums Up to name a few. He holds an MBA from IIMA.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
