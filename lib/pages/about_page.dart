import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            splashRadius: 20.0,
            icon: new Icon(
              Icons.arrow_back,
              size: 23.0,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: new Text(
          'About Application',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 25.0, 35.0, 0.0),
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
              'The simplest notes app on the market,\nfun and easy to use.\n\n\nFeatures:\n - Save, edit and delete notes.\n - Search for notes content.\n - Arabic and RTL lanuages support.\n\n\nDeveloper Contact:\nahmad.alshahal2@gmail.com',
              textAlign: TextAlign.start,
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
            new SizedBox(height: 50.0),
            new Text(
              'V 0.0.1',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}