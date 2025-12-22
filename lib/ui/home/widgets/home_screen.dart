import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/colors.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';
import 'package:flutter_mapp/ui/note/widgets/note_screen.dart';
import '../../../core/dependencies.dart';
import '../../../domain/models/note.dart';
import 'categories_bottom_sheet.dart';
import 'note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModelProvider.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = await Navigator.push(
            context,
            MaterialPageRoute<Note>(builder: (_) => const NoteScreen()),
          );
          if (note != null) viewModel.addNote(note);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Note'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () => _openCategories(context),
            icon: Icon(Icons.color_lens, color: Colors.green),
          ),
        ],
        elevation: Dimens.appBarElevation,
        shadowColor: Colors.green,
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return GridView.count(
            crossAxisCount: Dimens.homeGridCount,
            childAspectRatio: Dimens.homeGridChildAspectRatio,
            children: [...viewModel.notes.map((note) => NoteCard(note: note))],
          );
        },
      ),
    );
  }

  void _openCategories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => CategoriesBottomSheet(),
    );
  }
}
