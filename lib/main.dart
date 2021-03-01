import 'package:Notepad/pages/homePage/home_page.dart';
import 'package:Notepad/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new BaseWidget());
}

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Notepad",
      home: new SplashScreen(),
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
/*
 TODO: 
    - Use the named routes technique.
    - Remove the global state and learn Provider.
    - Change Modifiing string technique.
    - A bug appeared when the text goes out of scope in textFields (When the state is gone).
*/