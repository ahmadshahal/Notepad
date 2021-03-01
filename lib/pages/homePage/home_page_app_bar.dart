import 'package:Notepad/pages/about_page.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatefulWidget {
  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  bool areSearching = false;

  Widget leadingIcon(BuildContext context) {
    if (this.areSearching) {
      return new IconButton(
        splashRadius: 20.0,
        icon: new Icon(
          Icons.arrow_back,
          size: 23.0,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          setState(() {
            this.areSearching = false;
          });
        },
      );
    } else
      return null;
  }

  Widget title(BuildContext context) {
    if (this.areSearching) {
      return new Container(
        margin: EdgeInsets.only(left: 5.0),
        child: new TextField(
          autofocus: true,
          showCursor: true,
          keyboardType: TextInputType.text,
          maxLines: 1,
          cursorColor: Theme.of(context).accentColor,
          textCapitalization: TextCapitalization.none,
          style: new TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w400,
              fontSize: 19.0),
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: new TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w400,
                fontSize: 19.0),
          ),
        ),
      );
    } else {
      return new Container(
        margin: EdgeInsets.only(left: 5.0),
        child: new Text(
          "Notes",
          style: new TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Widget searchButton(BuildContext context) {
    if (this.areSearching)
      return Container();
    else {
      return new IconButton(
        tooltip: 'Search',
        splashRadius: 20.0,
        icon: new Icon(
          Icons.search,
          size: 25.0,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            this.areSearching = true;
          });
        },
      );
    }
  }

  Widget moreButton(BuildContext context) {
    if (this.areSearching)
      return new Container();
    else {
      return new PopupMenuButton(
        tooltip: 'More',
        onSelected: (int selected) {
          if (selected == 1)
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => new AboutPage()),
            );
        },
        // * Couldn't find a way to change the button's splash.
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: leadingIcon(context),
      actions: [
        searchButton(context),
        moreButton(context),
      ],
      title: title(context),
      elevation: 4.0,
    );
  }
}
