import 'dart:async';

import 'package:Notepad/pages/homePage/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new Timer(
        new Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => new HomePage())));
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Container(
        alignment: Alignment.center,
        child: new Image.asset(
          'assets/icon.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
