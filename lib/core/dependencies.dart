import 'package:flutter/cupertino.dart';
import 'package:flutter_mapp/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_mapp/ui/note/view_models/note_viewmodel.dart';

class HomeViewModelProvider extends InheritedWidget {
  const HomeViewModelProvider({
    super.key,
    required super.child,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  static HomeViewModel of(BuildContext context) {
    final HomeViewModelProvider? provider = context
        .dependOnInheritedWidgetOfExactType<HomeViewModelProvider>();
    assert(provider != null, 'No HomeViewModelProvider found in context');
    return provider!.viewModel;
  }

  @override
  bool updateShouldNotify(HomeViewModelProvider oldWidget) {
    return viewModel != oldWidget.viewModel;
  }
}

class NoteViewModelProvider extends InheritedWidget {
  const NoteViewModelProvider({
    super.key,
    required this.viewModel,
    required super.child,
  });

  final NoteViewModel viewModel;

  static NoteViewModel of(BuildContext context) {
    final NoteViewModelProvider? provider = context
        .dependOnInheritedWidgetOfExactType<NoteViewModelProvider>();
    assert(provider != null, 'No NoteViewModelProvider found in context');
    return provider!.viewModel;
  }

  @override
  bool updateShouldNotify(NoteViewModelProvider oldWidget) {
    return viewModel != oldWidget.viewModel;
  }
}
