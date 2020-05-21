import 'package:flutter/material.dart';

class Portofolio {
  String url;
  Color color;
  String image;

  Portofolio({this.url, this.color, this.image});
}

final List<Portofolio> myPortos = [
  Portofolio(
      image: "images/portfolio1.png",
      color: Colors.pinkAccent,
      url: 'https://arxist.com/'),
  Portofolio(
      image: "images/portfolio2.png",
      color: Colors.white30,
      url: 'https://github.com/zynhrus/NewsApp'),
  Portofolio(
      image: "images/portfolio4.png",
      color: Color.fromRGBO(21, 25, 46, 1),
      url: 'https://github.com/zynhrus/BMI_Calculator'),
  Portofolio(
      image: "images/portfolio3.png",
      color: Colors.grey,
      url: 'https://github.com/zynhrus/React-Movie'),
  Portofolio(
      image: "images/portfolio5.png",
      color: Colors.white10,
      url: 'https://gitlab.com/albertOnly/weather-api'),
];
