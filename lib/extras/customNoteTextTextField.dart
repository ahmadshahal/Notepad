import 'package:Notepad/stateManagment/global_state.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';


// ! Fix this bug.
class CustomNoteTextTextField extends StatefulWidget {
  final String text;
  final GlobalNoteDataState store = GlobalNoteDataState.instance;
  TextEditingController textEditingController;

  CustomNoteTextTextField({this.text})
  {
    textEditingController = new TextEditingController(text: text);
  }

  @override
  State<StatefulWidget> createState() {
    return new _CustomNoteTextTextFieldState();
  }
}

class _CustomNoteTextTextFieldState extends State<CustomNoteTextTextField> {
  String changableText;
  bool isRTL = false;

  @override
  void initState() {
    super.initState();
    this.changableText = widget.text ?? "";
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
          // * text will be saved in the global state each time it is changed
          // * so it can be used to change the data.
          widget.store.set('text', text);
          setState(() {
            changableText = text;
          });
        },
        showCursor: true,
        controller: widget.textEditingController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        scrollPhysics: new BouncingScrollPhysics(),
        cursorColor: Colors.white,
        textCapitalization: TextCapitalization.sentences,
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w300,
            fontSize: 16.0),
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Type Something ..",
          hintStyle: new TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w300,
              fontSize: 16.0),
        ),
      ),
    );
  }
}
