import 'package:Notepad/utilities/utilities.dart';

class Note {
  String title;
  // TODO: implement the last modified date
  String date = Utility.dateTransformer(DateTime.now());
  String noteText;
  String color;

  Note({this.title, this.color, this.noteText});

  Note.fromMap(Map<String, dynamic> json) { 
    this.title = json['title'];
    this.noteText = json['text'];
    this.color = json['color'].toString();
    this.date = json['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'text': this.noteText,
      'color': this.color,
      'date': this.date
    };
  }
}
