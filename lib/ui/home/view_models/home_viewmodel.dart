import 'package:flutter/material.dart';
import 'package:flutter_mapp/data/repositories/note/note_repository.dart';

import '../../../domain/models/note.dart';
import '../../../utlis/result.dart';

class HomeViewModel extends ChangeNotifier{
    final Map<Color, String> _colors = {
      Colors.green: 'green',
      Colors.yellow: 'yellow',
      Colors.red: 'red',
      Colors.white: 'white',
      Colors.blue: 'blue',
      Colors.pink: 'pink',
      Colors.orange: 'orange',
      Colors.brown: 'brown',
      Colors.purple: 'purple',
      Colors.grey: 'grey',
    };
    final NoteRepository _repository;
    HomeViewModel(this._repository){
      _loadNotes();
    }

    // final List<Note> _notes = [
    //   const Note(
    //     title: 'Grocery List',
    //     date: '2025-12-22',
    //     content: 'Buy spinach, apples, and milk.',
    //     category: 'green',
    //   ),
    //   const Note(
    //     title: 'Idea for App',
    //     date: '2025-12-21',
    //     content: 'A social network for plant lovers.',
    //     category: 'yellow',
    //   ),
    //   const Note(
    //     title: 'Urgent: Car Service',
    //     date: '2025-12-20',
    //     content: 'Brakes are squeaking. Call mechanic ASAP.',
    //     category: 'red',
    //   ),
    //   const Note(
    //     title: 'Meeting Minutes',
    //     date: '2025-12-19',
    //     content: 'Discussed Q1 goals and budget allocation.',
    //     category: 'white',
    //   ),
    //   const Note(
    //     title: 'Workout Routine',
    //     date: '2025-12-18',
    //     content: 'Leg day: Squats, Lunges, and Deadlifts.',
    //     category: 'blue',
    //   ),
    //   const Note(
    //     title: 'Gift Ideas',
    //     date: '2025-12-17',
    //     content: 'Perfume for Sarah, book for Dad.',
    //     category: 'pink',
    //   ),
    //   const Note(
    //     title: 'Travel Itinerary',
    //     date: '2025-12-16',
    //     content: 'Flight at 8 AM, check-in at 2 PM.',
    //     category: 'orange',
    //   ),
    //   const Note(
    //     title: 'Coffee Beans Review',
    //     date: '2025-12-15',
    //     content: 'Ethiopian roast: nutty with berry notes.',
    //     category: 'brown',
    //   ),
    //   const Note(
    //     title: 'Book Quotes',
    //     date: '2025-12-14',
    //     content: "‘Not all those who wander are lost.’",
    //     category: 'purple',
    //   ),
    //   const Note(
    //     title: 'Archived Thoughts',
    //     date: '2025-12-13',
    //     content: 'Random thoughts about the universe.',
    //     category: 'grey',
    //   ),
    // ];

    List<Note> _notes = [];
    final ValueNotifier<String?> selectedCategory = ValueNotifier<String?>(null);

    Map<Color, String> get colors => _colors;

    final TextEditingController colorCategory = TextEditingController();


    Future<void> _loadNotes() async {
      final result = await _repository.getNote();
      if(result is Ok<List<Note>>){
        _notes = result.value;
        notifyListeners();
      }
    }


    List<Note> get notes {
      if(selectedCategory.value == null) return _notes;
      return _notes.where((note) => note.category?.toLowerCase() == selectedCategory.value?.toLowerCase()).toList();
    }

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

    void updateName(Color color, String name){
     _colors[color] = name;
     notifyListeners();
    }

    void selectCategory(String category){
      selectedCategory.value = category;
      notifyListeners();
    }


  }
