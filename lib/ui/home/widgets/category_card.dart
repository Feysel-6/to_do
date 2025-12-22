import 'package:flutter/material.dart';

import '../../../core/dependencies.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.element});

  final MapEntry<Color, String> element;

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModelProvider.of(context);

    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        return Card(
          child: ColoredBox(
            color: element.key,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                enabled: viewModel.isEditing,
                decoration: InputDecoration(
                  hintText:
                      element.value[0].toUpperCase() +
                      element.value.substring(1),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  border: viewModel.isEditing ? UnderlineInputBorder() : InputBorder.none,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
