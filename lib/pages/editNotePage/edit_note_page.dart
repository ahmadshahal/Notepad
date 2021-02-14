import 'package:Notepad/extras/pop_result.dart';
import 'package:Notepad/pages/editNotePage/edit_note_page_app_bar.dart';
import 'package:Notepad/stateManagment/global_state.dart';
import 'package:Notepad/utilities/utilities.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final String title;
  final String text;
  final String date;

  // !: Change After Learning State Managment
  final GlobalNoteDataState store = GlobalNoteDataState.instance;

  EditPage({this.title, this.text, this.date});

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      // * Overrides the android back button functionality
      onWillPop: () {
        store.set('title', null);
        store.set('text', null);
        // * If this wasn't used, a PopResult instance will not be created and we will get
        // * a Null Pointer Exception in Note Card class.
        Navigator.pop(context, new PopResult(save: false, delete: false));
        // * If the value is false, it will not be popped, but we used the manual pop
        // * technique using Navigator.pop
        return Future.value(false);
      },
      child: new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: new PreferredSize(
          child: new EditPageAppBar(),
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
              new TextField(
                onChanged: (String text) {
                  // * title will be saved in the global state each time it is changed
                  // * so it can be used to change the data.
                  store.set('title', text);
                  // * If no changes happen, String text will be null.
                },
                showCursor: true,
                controller: TextEditingController(text: this.title),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Theme.of(context).accentColor,
                textCapitalization: TextCapitalization.words,
                style: new TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0),
                // TODO: Implement Arabic Support
                textDirection: Utility.isArabic(this.title)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: new TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w600,
                      fontSize: 26.0),
                ),
              ),
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
              new TextField(
                onChanged: (String text) {
                  // * text will be saved in the global state each time it is changed
                  // * so it can be used to change the data.
                  store.set('text', text);
                },
                showCursor: true,
                controller: TextEditingController(text: this.text),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                scrollPhysics: new BouncingScrollPhysics(),
                cursorColor: Colors.white,
                textCapitalization: TextCapitalization.sentences,
                style: new TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0),
                // TODO: Implement Arabic Support
                textDirection: Utility.isArabic(this.text)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Something ..",
                  hintStyle: new TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
