import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Notepad/extras/note.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  // * Returns the path of the app's directory in android unreachable files.
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // * Returns the Json file.
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notes.json');
  }

  // * Writes Json data to the Json file.
  Future<File> write(String jsonData) async {
    final file = await _localFile;
    return file.writeAsString('$jsonData');
  }

  // * Reads from the Json file.
  Future<String> read() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return -1.
      return "-1";
    }
  }

  // * Writes a List of Notes to Json file after converting it to Json data.
  Future<File> writeListToJsonFile(List<Note> list) {
    List<Map<String, dynamic>> jsonList = []; // List of Maps.
    for (int i = 0; i < list.length; i++) {
      jsonList.add(list[i].toMap());
    }
    String rawJson = jsonEncode(jsonList); // Converting to Json raw format.
    return write(rawJson);
  }
}
