import 'package:flutter/material.dart';
import 'package:portfolioweb/helper/entrance_fader.dart';
import 'package:portfolioweb/views/experience_and_education.dart';
import 'package:portfolioweb/views/footer.dart';
import 'package:portfolioweb/views/header.dart';
import 'package:portfolioweb/views/portfolio.dart';
import 'package:portfolioweb/views/profile.dart';
import 'package:portfolioweb/views/skill.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 28)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: -0.3 * offset,
              left: 0,
              right: 0,
              height: screenHeight,
              child: RepaintBoundary(
                child: EntranceFader(
                  delay: Duration(milliseconds: 400),
                  child: Image.asset(
                    'images/star.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.25 * screenHeight,
              left: 0,
              right: 0,
              child: EntranceFader(
                delay: Duration(milliseconds: 400),
                offset: Offset(0, -60),
                child: MainText(),
              ),
            ),
            Header(),
            Scrollbar(
              child: ListView(
                cacheExtent: 64,
                controller: _scrollController,
                children: <Widget>[
                  Container(height: screenHeight),
                  // PROFILE
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 100,
                    child: Text('PROFILE'),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, const Color(0xFF040904)],
                      ),
                    ),
                  ),
                  screenHeight > screenWidth || screenWidth < 775
                      ? ProfileMobile()
                      : Profile(),
                  // SKILLS
                  Container(
                    alignment: screenHeight > screenWidth
                        ? Alignment.bottomCenter
                        : Alignment.center,
                    height: screenHeight > screenWidth ? 100 : 250,
                    child: Text('SKILLS'),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF040904), Colors.black],
                      ),
                    ),
                  ),
                  screenHeight > screenWidth
                      ? SkillMobile(
                          screenWidth: screenWidth, screenHeight: screenHeight)
                      : Skill(
                          screenHeight: screenHeight, screenWidth: screenWidth),
                  // EXPERIENCES & EDUCATION
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    child: Text('Experience & Education'),
                    color: Colors.black,
                  ),
                  ExperienceAndEducation(
                      screenHeight: screenHeight, screenWidth: screenWidth),
                  // PORTFOLIO
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(76, 61, 243, 1),
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Portfolio(),
                  // FOOTER
                  Container(
                    height: 50,
                    color: Colors.black,
                  ),
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
