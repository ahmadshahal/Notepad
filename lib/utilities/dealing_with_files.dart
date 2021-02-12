import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Notepad/extras/note.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notes.json');
  }

  Future<File> write(String jsonData) async {
    final file = await _localFile;
    return file.writeAsString('$jsonData');
  }

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

  Future<File> writeListToJsonFile(List<Note> list) {
    List<Map<String, dynamic>> jsonList = [];
    for (int i = 0; i < list.length; i++) {
      jsonList.add(list[i].toMap());
    }
    String rawJson = jsonEncode(jsonList);
    return write(rawJson);
  }
}
