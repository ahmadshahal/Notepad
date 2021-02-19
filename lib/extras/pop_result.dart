class PopResult {
  bool save; // True if save button is pressed.
  bool delete; // True if delete button is pressed.
  // * Variables that hold values after it is changed
  // * so it can be changed in:
  // *                          - Json files
  // *                          - Notes list
  // *                          - NoteCard widget
  String title;
  String text; 
  String color; 

  PopResult({this.save, this.delete, this.text, this.title, this.color});
}
