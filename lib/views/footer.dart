import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  launch('https://www.facebook.com/albert.dayak');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5)),
                  child: Image.asset(
                    'images/facebook.png',
                    width: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch('https://www.linkedin.com/in/albert-112857176/');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5)),
                  child: Image.asset(
                    'images/linkedin.png',
                    width: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch('https://github.com/zynhrus');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5)),
                  child: Image.asset(
                    'images/github.png',
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Albert \u00a92020',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
