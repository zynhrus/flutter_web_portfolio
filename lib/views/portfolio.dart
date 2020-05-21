import 'package:flutter/material.dart';
import 'package:portfolioweb/helper/entrance_fader.dart';
import 'package:portfolioweb/model/portfolio_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var small = width <= 380;
    return Container(
      color: Colors.black,
      height: height > width ? height * 0.52 : height * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.4,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: EntranceFader(
                offset: Offset(width / 4, 0),
                duration: Duration(seconds: 1),
                child: Text(
                  'PORTFOLIO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              duration: Duration(seconds: 1),
              child: PageView.builder(
                  itemCount: myPortos.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          height: height * 0.4,
                          child: Container(
                            color: myPortos[index].color,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch(myPortos[index].url);
                          },
                          child: small
                              ? Image.asset(
                                  myPortos[index].image,
                                  fit: BoxFit.fitWidth,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_back,
                                      size: 30,
                                    ),
                                    Image.asset(
                                      myPortos[index].image,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 30,
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
