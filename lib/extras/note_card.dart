import 'package:Notepad/extras/note.dart';
import 'package:Notepad/extras/pop_result.dart';
import 'package:Notepad/pages/editNotePage/edit_note_page.dart';
import 'package:Notepad/utilities/utilities.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  // * References to methods that change state in a Upper Widgets.
  final Function removeFromList;
  final Function editElementFromList;

  NoteCard({this.note, this.removeFromList, this.editElementFromList});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      borderRadius: BorderRadius.circular(7.0),
      onLongPress: () {
        /*
          TODO: Implement
        */
      },
      onTap: () {
        Navigator.push<PopResult>(
          context,
          new MaterialPageRoute(
            // the => symbol is equivalent to return statement.
            builder: (BuildContext context) => new EditPage(
              title: this.note.title,
              text: this.note.noteText,
              date: this.note.date,
            ),
          ),
        ).then((PopResult popResult) {
          if (popResult.delete) {
            // If delete button is pressed.
            removeFromList(this.note);
          } else if (popResult.save) {
            // If save button is pressed.
            editElementFromList(this.note, popResult.title, popResult.text);
          }
        });
      },
      child: new Card(
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        color: new Color(int.parse(this.note.color)),
        child: new Container(
          padding: EdgeInsets.all(17.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: new Text(
                  // ! Consider changing this technique.
                  Utility.modifyStringLength(this.note.title ?? ""),
                  // * value ?? is equivalent to:
                  // * if value is null set it to this (after the ??)
                  // * else keep it as it is.
                  // TODO: Implement Arabic Support because it is not working efficiently.
                  textDirection: Utility.isArabic(this.note.title)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style: new TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
              ),
              new Container(
                alignment: Alignment.bottomLeft,
                child: new Text(
                  this.note.date,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
