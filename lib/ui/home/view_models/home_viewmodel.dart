import 'package:flutter/material.dart';

import '../../../domain/models/note.dart';

class HomeViewModel extends ChangeNotifier{
    final Map<Color, String> _colors = {
      Colors.green: 'Green',
      Colors.yellow: 'Yellow',
      Colors.red: 'red',
      Colors.white: 'white',
      Colors.blue: 'blue',
      Colors.pink: 'pink',
      Colors.orange: 'orange',
      // Colors.black: 'black',
      Colors.brown: 'brown',
      Colors.purple: 'purple',
      Colors.grey: 'grey',
    };

    final List<Note> _notes = [];

    Map<Color, String> get colors => _colors;

    List<Note> get notes => List.unmodifiable(_notes);
    bool _isEditing = false;
    bool get isEditing => _isEditing;

    void toggleEditing(){
      _isEditing = !_isEditing;
      notifyListeners();
    }

    void addNote(Note note){
      _notes.add(note);
      notifyListeners();
    }
    void removeNote(Note note){
      _notes.remove(note);
      notifyListeners();
    }
  }
