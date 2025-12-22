import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/colors.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';
import 'package:flutter_mapp/ui/note/widgets/note_screen.dart';

import '../../../core/assets.dart';
import '../../../domain/models/note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => NoteScreen(note: note)),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: Dimens.cardElevation,
        child: GridTile(
          footer: Container(
            decoration: BoxDecoration(color: AppColors.primary),
            child: ListTile(
              title: Text(note.title,),
              subtitle: Text(note.date,),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              scrollPhysics: NeverScrollableScrollPhysics(),
              note.content,
              maxLines: 10,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.start,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => NoteScreen(note: note),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
