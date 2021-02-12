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
    NotesList notesList = new NotesList();

    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
                Function addFunction = store.get('addFunction');
                addFunction(popResult.title, popResult.text, Utility.colors[new Random().nextInt(Utility.colors.length)]);
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
      body: notesList,
    );
  }
}
