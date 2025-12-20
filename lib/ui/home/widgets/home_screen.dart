import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/colors.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';
import 'package:flutter_mapp/ui/home/view_models/home_viewmodel.dart';
import 'categories_bottom_sheet.dart';
import 'note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
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
      body: GridView.count(
        crossAxisCount: Dimens.homeGridCount,
        childAspectRatio: Dimens.homeGridChildAspectRatio,
        children: List.generate(9, (_) => NoteCard()),
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


