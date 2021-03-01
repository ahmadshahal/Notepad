import 'package:Notepad/pages/about_page.dart';
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
        // new IconButton(
        //   tooltip: 'More',
        //   splashRadius: 20.0,
        //   icon: new Icon(
        //     Icons.more_vert,
        //     size: 25.0,
        //     color: Theme.of(context).accentColor,
        //   ),
        //   onPressed: () {
        //     showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return new SimpleDialog(
        //             titlePadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        //             title: new Text(
        //               'Made with ❤ by Dr. Ford',
        // textAlign: TextAlign.center,
        // style: new TextStyle(fontSize: 17.0),
        //             ),
        //           );
        //         });
        //   },
        // ),
        // * Couldn't find a way to change the button's splash.
        new PopupMenuButton(
          tooltip: 'More',
          onSelected: (int selected) {
            if (selected == 1)
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage()),
              );
          },
          icon: new Icon(
            Icons.more_vert,
            size: 25.0,
            color: Theme.of(context).accentColor,
          ),
          offset: new Offset(0, 400),
          itemBuilder: (context) {
            return [
              new PopupMenuItem(
                height: 40.0,
                value: 1,
                child: new Text('About Application'),
              )
            ];
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
      elevation: 4.0,
    );
  }
}
