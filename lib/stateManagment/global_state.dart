class GlobalNoteDataState {
  final Map<String, dynamic> _data = <String, dynamic>{
    'title': null,
    'text': null,
    'addFunction' : null
  };

  static GlobalNoteDataState instance = GlobalNoteDataState._();
  GlobalNoteDataState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) {
    return _data[key];
  }
}
