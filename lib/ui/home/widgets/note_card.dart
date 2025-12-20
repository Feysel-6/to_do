import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';
import 'package:flutter_mapp/ui/note/widgets/note_screen.dart';

import '../../../core/assets.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const NoteScreen()));
      },
      child: Card(
        color: Colors.white,
        elevation: Dimens.cardElevation,
        child: GridTile(
          footer: ListTile(
            title: const Text('This Monday'),
            subtitle: const Text('09-12-2025'),
            trailing: const Icon(Icons.more_vert),
          ),
          child: Align(alignment: Alignment.topCenter,child: Image.asset(Assets.notePreview,)),
        ),
      ),
    );
  }
}