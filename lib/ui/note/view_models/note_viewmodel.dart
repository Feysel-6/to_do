import 'package:flutter/material.dart';

import '../../../domain/models/note.dart';

class NoteViewModel {
  final TextEditingController noteDescriptionController =
      TextEditingController();
  final TextEditingController noteTitleController = TextEditingController();

  void saveNote() {}

  Note? buildNote() {
    final title = noteTitleController.text.trim();
    final content = noteDescriptionController.text.trim();
    if(title.isEmpty && content.isEmpty) return null;
    return Note(
      title: title.isEmpty ? 'Untitled' : title,
      content: noteDescriptionController.text.trim(),
      date:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
    );
  }
}
