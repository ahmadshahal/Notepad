import 'package:Notepad/extras/pop_result.dart';
import 'package:Notepad/stateManagment/global_state.dart';
import 'package:flutter/material.dart';

class EditPageAppBar extends StatelessWidget {
  // !: Change After Learning State Managment
  final GlobalNoteDataState store = GlobalNoteDataState.instance;

  // * Shows a Delete Alert Dialog.
  void _showDeleteWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Delete this note?"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Delete"),
                onPressed: () {
                  // * Empties the values saved in the global state before popping
                  // * because they are no longer needed.
                  store.set('title', null);
                  store.set('text', null);
                  store.set('color', null);
                  Navigator.pop(context); // pops the dialog.
                  Navigator.pop(
                    context,
                    new PopResult(save: false, delete: true, color: null),
                  );
                  // pops the page.
                },
              ),
              new FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context); // pops the dialog.
                },
              ),
            ],
          );
        });
  }

  // * Shows a Go Back Alert Dialog.
  void showBackWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Discard Changes?"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Discard"),
                onPressed: () {
                  // * Empties the values saved in the global state before popping
                  // * because they are no longer needed.
                  store.set('title', null);
                  store.set('text', null);
                  String color = store.get('color');
                  store.set('color', null);
                  Navigator.pop(context); // pops the dialog.
                  Navigator.pop(
                    context,
                    new PopResult(save: false, delete: false, color: color),
                  );
                  // pops the page.
                },
              ),
              new FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context); // pops the dialog.
                },
              ),
            ],
          );
        });
  }

  // * Creates a Dialog Item.
  Widget simpleDialogItem(
      BuildContext context, String colorName, String color) {
    return new SimpleDialogOption(
      onPressed: () {
        store.set('color', color); // Saving the pressed color in the global state.
        Navigator.pop(context);
      },
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Icon(
            Icons.colorize_sharp,
            color: new Color(
              int.parse(color),
            ),
          ),
          new SizedBox(
            width: 15.0,
          ),
          new Text(colorName),
        ],
      ),
    );
  }

  // * Shows a Choose Color Alert Dialog.
  void showChooseColorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text("Choose Color"),
            children: <Widget>[
              simpleDialogItem(context, "Red", "0xFFFF8A80"),
              simpleDialogItem(context, "Green", "0xFFC8E6C9"),
              simpleDialogItem(context, "Blue", "0xFFB3E5FC"),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: new IconButton(
        splashRadius: 20.0,
        icon: new Icon(
          Icons.arrow_back,
          size: 23.0,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          // * If and only if the title or the text changed, show the dialog.
          // * Else, just pop the page, but pop the color with it.
          // * If they didn't change, they will be null.
          if (store.get('title') != null || store.get('text') != null)
            showBackWarningDialog(context);
          else {
            String color = store.get('color');
            store.set('color', null); // Emptying the state.
            Navigator.pop(
              context,
              new PopResult(
                save: false,
                delete: false,
                color: color,
              ),
            );
          }
        },
      ),
      actions: [
        new IconButton(
          tooltip: "Delete",
          splashRadius: 20.0,
          icon: new Icon(
            Icons.delete,
            size: 23.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            // * Shows the delete alert dialog.
            _showDeleteWarningDialog(context);
          },
        ),
        // new SizedBox(width: 7.0),
        new IconButton(
          tooltip: "Change Color",
          splashRadius: 20.0,
          icon: new Icon(
            Icons.color_lens,
            size: 23.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            showChooseColorDialog(context);
          },
        ),
        // new SizedBox(width: 7.0),
        new IconButton(
          tooltip: "Save",
          splashRadius: 20.0,
          icon: new Icon(
            Icons.save,
            size: 22.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            // * Saving the values of the global state in variables then emptying them.
            String title = store.get('title');
            String text = store.get('text');
            String color = store.get('color');
            store.set('title', null);
            store.set('text', null);
            store.set('color', null);
            Navigator.pop(
              context,
              new PopResult(
                delete: false,
                save: true,
                text: text,
                title: title,
                color: color,
              ),
            );
          },
        ),
        new SizedBox(width: 7.0),
      ],
      elevation: 4.0,
    );
  }
}
