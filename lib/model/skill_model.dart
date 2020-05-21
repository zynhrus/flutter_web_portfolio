import 'package:flutter/material.dart';

class Skills {
  Color color;
  String image;
  int rating;
  String name;

  Skills({this.color, this.image, this.rating, this.name});
}

final List<Skills> mySkills = [
  Skills(
      image: 'images/flutter.png',
      color: Colors.blue,
      name: 'Flutter',
      rating: 9),
  Skills(
      image: 'images/js.png',
      color: Colors.yellow,
      name: 'Javascript',
      rating: 8),
  Skills(
      image: 'images/dart.png',
      color: Colors.lightBlueAccent,
      name: "Dart",
      rating: 9),
  Skills(
      image: 'images/swift.png',
      color: Colors.deepOrange,
      name: 'Swift',
      rating: 6),
  Skills(
      image: 'images/react.png',
      color: Colors.lightBlue,
      name: "React.js",
      rating: 7),
];
