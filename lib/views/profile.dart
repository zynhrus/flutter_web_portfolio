import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolioweb/helper/entrance_fader.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          color: Colors.black,
        ),
        Positioned(
          top: 0,
          left: -300,
          right: 0,
          height: height,
          child: RepaintBoundary(
            child: EntranceFader(
              offset: Offset(-width / 2, 0),
              delay: Duration(milliseconds: 300),
              child: Image.asset(
                'images/plane.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: width < 875 ? 300 : width < 1075 ? 400 : 600,
          height: height,
          child: EntranceFader(
            offset: Offset(-width / 2, 0),
            delay: Duration(milliseconds: 300),
            duration: Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        'Albert \nMobile Developer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        child: Stack(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 80.0,
                              backgroundImage: AssetImage('images/profile.jpg'),
                              backgroundColor: Colors.transparent,
                            ),
                            Positioned(
                              right: 30,
                              bottom: 30,
                              child: Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(160),
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Hello my name's Albert, I'm a self-taught mobile developer. I have using flutter for a year.  Now I am working on Arxist App, it's a creative platform in Indonesia and Southeast Asia for Artists, Creators, Streamers, or anyone who works in the creative world, who wants to share their works and get financial support. It planned to be released next month. ",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "I'm also looking for a job as Flutter Mobile Developer, I have a strong understanding of design concept in Flutter and implementing API to the mobile app. Here is my CV",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      launch(
                          'https://drive.google.com/open?id=1KN4jif3uzlrmQrlwdAND5BnvRepHco5y');
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'My CV',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var small = width < 380;

    return Container(
      width: width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  'Albert \nMobile Developer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: small ? 24 : 28,
                  ),
                ),
                Container(
                  width: small ? 100 : 120,
                  height: small ? 100 : 120,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: small ? 40 : 50,
                        backgroundImage: AssetImage('images/profile.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      Positioned(
                        left: 7.5,
                        top: 7.5,
                        child: Container(
                          height: small ? 80 : 100,
                          width: small ? 80 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            border: Border.all(
                                width: 1,
                                color: Colors.white,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Hello my name's Albert, I'm a self-taught mobile developer. I have using flutter for a year.  Now I am working on Arxist App, it's a creative platform in Indonesia and Southeast Asia for Artists, Creators, Streamers, or anyone who works in the creative world, who wants to share their works and get financial support. It planned to be released next month. ",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 12),
            Text(
              "I'm also looking for a job as Flutter Mobile Developer, I have a strong understanding of design concept in Flutter and implementing API to the mobile app. Here is my CV",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                launch(
                    'https://drive.google.com/open?id=1KN4jif3uzlrmQrlwdAND5BnvRepHco5y');
              },
              child: Container(
                height: 40,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'My CV',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
