import 'package:Notepad/pages/homePage/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new BaseWidget());
}

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Notepad",
      home: new HomePage(),
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        accentColor: Colors.white,
        fontFamily: "Roboto",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}