import 'dart:convert';

import 'package:Notepad/extras/note.dart';
import 'package:Notepad/extras/note_card.dart';
import 'package:Notepad/stateManagment/global_state.dart';
import 'package:Notepad/utilities/dealing_with_files.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesList extends StatefulWidget {
  // !: Change After Learning State Managment
  final GlobalNoteDataState store = GlobalNoteDataState.instance;
  final FileManager fileManager = new FileManager();
  @override
  State<StatefulWidget> createState() {
    _NotesListState state = new _NotesListState();
    return state;
  }
}

class _NotesListState extends State<NotesList> {
  List<Note> notesList = [];

  @override
  void initState() {
    super.initState();
    widget.fileManager.read().then((String value) {
      setState(() {
        this.notesList.clear();
        final parseResult = json.decode(value);
        if (parseResult != -1 && parseResult != null) {
          parseResult.forEach((element) {
            this.notesList.add(new Note.fromMap(element));
          });
        }
      });
    });
  }

  void addToList(String title, String text, [String color = "0xFFC8E6C9"]) {
    setState(() {
      this.notesList.add(
            new Note(
              title: title,
              noteText: text,
              color: color,
            ),
          );
    });
    widget.fileManager.writeListToJsonFile(this.notesList);
    // * Change after learning Future
  }

  void editElementFromList(Note note, String title, String text) {
    setState(() {
      if (title != null)
        this.notesList[this.notesList.indexOf(note)].title = title;
      if (text != null)
        this.notesList[this.notesList.indexOf(note)].noteText = text;
    });
    // * If the textfield changed data, it won't be null in the global state.
    widget.fileManager.writeListToJsonFile(this.notesList);
    // * Change after learning Future
  }

  void removeFromList(Note note) {
    setState(() {
      this.notesList.remove(note);
    });
    widget.fileManager.writeListToJsonFile(this.notesList);
    // * Change after learning Future
  }

  @override
  Widget build(BuildContext context) {
    widget.store.set('addFunction', addToList);
    if (this.notesList.isEmpty) {
      return new Center(
        child: new Container(
          margin: EdgeInsets.only(bottom: 90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                height: 200.0,
                width: 200.0,
                child: new Image.asset("assets/b_5cbbf7de65149.png"),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Text(
                "No Notes Found",
                style: new TextStyle(
                    color: Colors.white38, letterSpacing: 2.0, fontSize: 20.0),
              )
            ],
          ),
        ),
      );
    }
    return new GridView.builder(
      physics: new BouncingScrollPhysics(),
      gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // * Don't Know Why
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      padding: EdgeInsets.all(15.0),
      itemBuilder: (BuildContext context, int index) {
        return new NoteCard(
          note: notesList[index],
          removeFromList: removeFromList,
          editElementFromList: editElementFromList,
        );
      },
      itemCount: this.notesList.length,
    );
  }
}
