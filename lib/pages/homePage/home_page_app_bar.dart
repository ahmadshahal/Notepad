import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        new IconButton(
          tooltip: 'Search',
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
          tooltip: 'More',
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
        /*
         * Couldn't find a way to change the button's splash.
          new PopupMenuButton(
            tooltip: 'More',
            icon: new Icon(
              Icons.more_vert,
              size: 25.0,
              color: Theme.of(context).accentColor,
            ),
            offset: new Offset(0, 400),
            itemBuilder: (context) {
              return this.popUpMenuStringElements.map((String text) {
                return new PopupMenuItem(
                  child: new Text(text),
                );
              }).toList();
            },
          ),
        */
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
      elevation: 4.0,
    );
  }
}
