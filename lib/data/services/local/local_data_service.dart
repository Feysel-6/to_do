import 'package:flutter_mapp/domain/models/note.dart';
import 'package:hive_ce/hive.dart';

class LocalDataService {
  final String _boxName = 'noteBox';
  Box<Note> get _noteBox => Hive.box<Note>(_boxName);

  Future<List<Note>> getNotes() async{
    return _noteBox.values.toList();
  }

  Future<void> saveNotes(Note note) async {
    await _noteBox.add(note);
  }

}