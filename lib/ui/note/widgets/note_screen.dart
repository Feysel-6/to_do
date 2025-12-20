import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';

import '../../core/themes/colors.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This Monday'),
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
        maxLines: null,
        expands: true,
        style: TextStyle(fontSize: 18, height: 1.5),
        decoration: InputDecoration(
          hintText: 'Bleed your ink ...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(Dimens.padding),
        ),
      ),
    );
  }
}
