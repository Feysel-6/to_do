import 'package:flutter/cupertino.dart';
import 'package:flutter_mapp/ui/home/view_models/home_viewmodel.dart';

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
