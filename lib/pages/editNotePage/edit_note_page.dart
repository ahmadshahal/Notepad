import 'package:Notepad/extras/customNoteTextTextField.dart';
import 'package:Notepad/extras/customTitleTextField.dart';
import 'package:Notepad/extras/pop_result.dart';
import 'package:Notepad/pages/editNotePage/edit_note_page_app_bar.dart';
import 'package:Notepad/stateManagment/global_state.dart';
import 'package:Notepad/utilities/utilities.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final String title;
  final String text;
  final String date;
  final String color;

  // !: Change After Learning State Managment
  final GlobalNoteDataState store = GlobalNoteDataState.instance;

  EditPage({this.title, this.text, this.date, this.color});

  @override
  Widget build(BuildContext context) {
    // * Created an instance and an object of the app bar so we can call the dialog method through it.
    EditPageAppBar editPageAppBar = new EditPageAppBar();
    return new WillPopScope(
      // * Overrides the android back button functionality
      // * If this wasn't used, a PopResult instance will not be created and we will get
      // * a Null Pointer Exception in Note Card class.
      // * If the Futute.value is false, it will not be popped, but we used the manual pop
      // * technique using Navigator.pop
      onWillPop: () {
        // * If and only if the title or the text changed, show the dialog.
        // * Else, just pop the page.
        // * If they didn't change, they will be null.
        if (store.get('title') != null || store.get('text') != null)
          editPageAppBar.showBackWarningDialog(context);
        else {
          String color = store.get('color');
          store.set('color', null); // Emptying the global state.
          Navigator.pop(
            context,
            // * Popping the color even if save isn't pressed.
            new PopResult(save: false, delete: false, color: color),
          );
        }
        return Future.value(false);
      },
      child: new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: new PreferredSize(
          child: editPageAppBar,
          preferredSize: Size.fromHeight(57.0),
        ),
        body: new Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: new ListView(
            physics: new BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 16.0,
              ),
              new CustomTitleTextField(title: this.title),
              new SizedBox(
                height: 9.0,
              ),
              new Text(
                // * If the date is null (we are creating a new Note), put today's date.
                this.date ?? Utility.dateTransformer(DateTime.now()),
                textAlign: TextAlign.start,
                style: new TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
              new SizedBox(
                height: 1.5,
              ),
              new CustomNoteTextTextField(text: this.text)
            ],
          ),
        ),
      ),
    );
  }
}
