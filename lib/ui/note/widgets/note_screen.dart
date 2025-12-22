import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';

import '../../../core/dependencies.dart';
import '../../../domain/models/note.dart';
import '../../core/themes/colors.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, this.note});

  final Note? note;

  @override
  Widget build(BuildContext context) {
    final viewModel = NoteViewModelProvider.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) return;
        final note = viewModel.buildNote();
        viewModel.noteDescriptionController.clear();
        viewModel.noteTitleController.clear();
        Navigator.of(context).pop(note);
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: viewModel.noteTitleController,
            style: const TextStyle(fontSize: 24),
            decoration: InputDecoration(
              hintText: note?.title ?? 'Title' ,
              border: InputBorder.none,
            ),
          ),
          backgroundColor: AppColors.primary,
          elevation: Dimens.appBarElevation,
          actions: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.more_vert, color: Colors.green),
            ),
          ],
        ),
        body: TextField(
          controller: viewModel.noteDescriptionController,
          maxLines: null,
          expands: true,
          style: TextStyle(fontSize: 18, height: 1.5),
          decoration: InputDecoration(
            hintText: note?.content ?? 'Bleed your ink ...',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(Dimens.padding),
          ),
        ),
      ),
    );
  }
}
