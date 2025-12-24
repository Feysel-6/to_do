import 'package:flutter/material.dart';
import 'package:flutter_mapp/core/dependencies.dart';
import 'package:flutter_mapp/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_mapp/ui/note/view_models/note_viewmodel.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'data/repositories/note/note_repository.dart';
import 'data/repositories/note/note_repository_local.dart';
import 'data/services/local/local_data_service.dart';
import 'domain/models/note.dart';
import 'navigation_wrapper.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox<Note>('noteBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localDataService = LocalDataService();
    final noteRepository = NoteRepositoryLocal(localDataService: localDataService);

    return HomeViewModelProvider(
      viewModel: HomeViewModel(noteRepository),
      child: NoteViewModelProvider(
        viewModel: NoteViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: NavigationWrapper(),
        ),
      ),
    );
  }
}
