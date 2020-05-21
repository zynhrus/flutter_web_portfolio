import 'package:flutter/material.dart';
import 'package:portfolioweb/helper/entrance_fader.dart';
import 'package:portfolioweb/model/skill_model.dart';

class Skill extends StatelessWidget {
  const Skill({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height:
          screenHeight > screenWidth ? screenHeight * 0.5 : screenHeight * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: screenWidth / 5 - 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SkillRating(
                      screenWidth: screenWidth,
                      name: 'Flutter',
                      rating: 9,
                      color: Colors.blue,
                    ),
                    SkillList(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      offset: Offset(0, screenHeight * 0.8),
                      image: 'images/js.png',
                    ),
                    SkillRating(
                      screenWidth: screenWidth,
                      name: 'Dart',
                      rating: 9,
                      color: Colors.lightBlueAccent,
                    ),
                    SkillList(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      offset: Offset(0, screenHeight * 0.8),
                      image: 'images/swift.png',
                    ),
                    SkillRating(
                      screenWidth: screenWidth,
                      name: 'React.js',
                      rating: 7,
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SkillList(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      image: 'images/flutter.png',
                    ),
                    SkillRating(
                      screenWidth: screenWidth,
                      height: 60,
                      color: Colors.yellow,
                      rating: 8,
                      name: 'Javascript',
                      offset: Offset(0, screenWidth / 2 - 40),
                    ),
                    SkillList(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      image: 'images/dart.png',
                    ),
                    SkillRating(
                      screenWidth: screenWidth,
                      height: 60,
                      color: Colors.deepOrange,
                      rating: 6,
                      name: 'Swift',
                      offset: Offset(0, screenWidth / 2 - 40),
                    ),
                    SkillList(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      image: 'images/react.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillRating extends StatelessWidget {
  const SkillRating(
      {Key key,
      @required this.screenWidth,
      this.name,
      this.rating,
      this.color,
      this.margin,
      this.offset,
      this.height})
      : super(key: key);

  final double screenWidth;
  final String name;
  final int rating;
  final Color color;
  final EdgeInsetsGeometry margin;
  final double height;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120),
      height: height == null ? null : height,
      width: screenWidth / 5,
      child: EntranceFader(
        offset: offset == null ? Offset(0, -screenWidth / 2 + 40) : offset,
        duration: Duration(milliseconds: 1500),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(name),
                  Text(
                    '${rating.toString()}/10',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 10,
                    width: (screenWidth / 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: 10,
                    width: ((screenWidth / 5) - 40) * (rating / 10),
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillList extends StatelessWidget {
  const SkillList(
      {Key key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.duration,
      this.offset,
      this.image})
      : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final Duration duration;
  final Offset offset;
  final String image;

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      offset: offset == null ? Offset(0, screenHeight * -0.8) : offset,
      duration: duration == null ? Duration(milliseconds: 1500) : duration,
      child: Container(
        width: screenWidth / 5,
        child: Image.asset(
          image,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class SkillMobile extends StatelessWidget {
  const SkillMobile({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight / 2,
      color: Colors.black,
      child: PageView.builder(
          itemCount: mySkills.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.arrow_back),
                    Image.asset(
                      mySkills[index].image,
                      fit: BoxFit.fitWidth,
                      width: screenWidth / 2,
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(mySkills[index].name),
                          Text(
                            '${mySkills[index].rating.toString()}/10',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: screenWidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Container(
                            height: 10,
                            width: (screenWidth - 80) * (9 / 10),
                            decoration: BoxDecoration(
                                color: mySkills[index].color,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
