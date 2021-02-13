import 'dart:math';

import 'package:Notepad/extras/pop_result.dart';
import 'package:Notepad/pages/editNotePage/edit_note_page.dart';
import 'package:Notepad/pages/homePage/home_page_app_bar.dart';
import 'package:Notepad/pages/homePage/notes_home_page_list.dart';
import 'package:Notepad/stateManagment/global_state.dart';
import 'package:Notepad/utilities/utilities.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // !: Change After Learning State Managment - 
  final GlobalNoteDataState store = GlobalNoteDataState.instance;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // * PreferredSize widget is needed when creating custom AppBar.
      appBar: new PreferredSize(
        child: new HomePageAppBar(),
        preferredSize: Size.fromHeight(57.0),
      ),
      floatingActionButton: new Container(
        margin: EdgeInsets.only(right: 6.5, bottom: 6.5),
        child: new FloatingActionButton(
          elevation: 5.0,
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push<PopResult>(
              context,
              new MaterialPageRoute(
                builder: (BuildContext context) => new EditPage(),
              ),
            ).then((PopResult popResult) {
              if (popResult.save && (popResult.text != null || popResult.title != null)) {
                // * If the save button is pressed, create a new Note only if: it has a title or a body or both.  
                Function addFunction = store.get('addFunction');
                // * Get the addFunction method reference from the global state.
                addFunction(popResult.title, popResult.text, Utility.colors[new Random().nextInt(Utility.colors.length)]);
                // * Choosing a random index number from the colors list.
              }
            });
          },
          child: new Icon(
            Icons.add,
            size: 27.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: new NotesList(),
    );
  }
}
