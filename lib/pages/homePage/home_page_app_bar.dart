import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        new IconButton(
          splashRadius: 20.0,
          icon: new Icon(
            Icons.search,
            size: 25.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            // TODO: Implement.
          },
        ),
        new IconButton(
          splashRadius: 20.0,
          icon: new Icon(
            Icons.more_vert,
            size: 25.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            // TODO: Implement.
          },
        ),
      ],
      title: new Container(
        margin: EdgeInsets.only(left: 5.0),
        child: new Text(
          "Notes",
          style: new TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      elevation: 20.0,
    );
  }
}
