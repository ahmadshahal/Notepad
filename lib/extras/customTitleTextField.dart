import 'package:Notepad/stateManagment/global_state.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';


// ! Fix this bug.
class CustomTitleTextField extends StatefulWidget {
  final String title;
  final GlobalNoteDataState store = GlobalNoteDataState.instance;
  TextEditingController textEditingController;
  CustomTitleTextField({this.title})
  {
    textEditingController = new TextEditingController(text: title);
  }

  @override
  State<StatefulWidget> createState() {
    return new _CustomTitleTextFieldState();
  }
}

class _CustomTitleTextFieldState extends State<CustomTitleTextField> {
  String changableText;
  bool isRTL = false;

  @override
  void initState() {
    super.initState();
    this.changableText = widget.title ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AutoDirection(
      text: changableText,
      onDirectionChange: (bool isRTL) {
        setState(() {
          this.isRTL = isRTL;
        });
      },
      child: new TextField(
        onChanged: (String text) {
          // * title will be saved in the global state each time it is changed
          // * so it can be used to change the data.
          widget.store.set('title', text);
          // * If no changes happen, String text will be null.
          setState(() {
            changableText = text;
          });
        },
        showCursor: true,
        controller: widget.textEditingController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        cursorColor: Theme.of(context).accentColor,
        textCapitalization: TextCapitalization.words,
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w600,
            fontSize: 26.0),
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Title",
          hintStyle: new TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w600,
              fontSize: 26.0),
        ),
      ),
    );
  }
}
