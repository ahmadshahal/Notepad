import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About Application'),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 0.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: new Image.asset(
                'assets/icon.png',
                width: 200,
                height: 200,
              ),
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Text(
              'The simplest notes app on the market, fun and easy to use.\n\nFeatures:\n - Save, edit and delete notes.\n - Search for notes content.\n - Arabic and RTL lanuages support.\n\nDeveloper Contact: ahmad.alshahal2@gmail.com',
              textAlign: TextAlign.start,
              style: new TextStyle(fontSize: 16.0),
            ),
            new SizedBox(height: 45.0),
            new Text(
              'V 0.0.1',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 16),
            ),
            new SizedBox(height: 45.0),
            new Text('Made with ❤ by Dr. Ford', textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
/*
new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Image.asset(
                'assets/dr_ford.png',
                height: 280,
                width: 280,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 5.0,
              ),
              new Text(
                'Made With ❤ By Dr. Ford',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 16.0),
              )
            ],
          ),
*/
