import 'package:flutter/material.dart';
import 'package:flutter_mapp/core/dependencies.dart';
import 'package:flutter_mapp/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_mapp/ui/note/view_models/note_viewmodel.dart';
import 'navigation_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewModelProvider(
      viewModel: HomeViewModel(),
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
