import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        children: <Widget>[
          Text('Albert'),
          Spacer(),
          if (MediaQuery.of(context).size.width > 900) ...[
            Text('Profile'),
            SizedBox(width: 32),
            Text('Skills'),
            SizedBox(width: 32),
            Text('About Me'),
            SizedBox(width: 32),
            Text('Portfolio'),
            SizedBox(width: 32),
          ],
          Icon(
            Icons.apps,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Hello I am Albert",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 60 : 40,
          ),
        ),
        SizedBox(height: 16),
        SizedBox(height: 32),
        Text(
          'For Your Information This Website Build With Flutter \nThank You',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32),
      ],
    );
  }
}

class ScrollView1 extends StatelessWidget {
  final dataKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      primary: true,
      appBar: new AppBar(
        title: const Text('Home'),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            new SizedBox(
                height: 160.0, width: double.infinity, child: new Card()),
            // destination
            new Card(
              key: dataKey,
              child: new Text("data\n\n\n\n\n\ndata"),
            )
          ],
        ),
      ),
      bottomNavigationBar: new RaisedButton(
        onPressed: () => Scrollable.ensureVisible(dataKey.currentContext),
        child: new Text("Scroll to data"),
      ),
    );
  }
}
