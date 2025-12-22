import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';

import '../../../core/dependencies.dart';
import 'category_card.dart';

class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModelProvider.of(context);
    return Container(
      height: Dimens.bottomSheetHeight,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _Header(),
          SizedBox(height: Dimens.spaceBetweenSections),
          Expanded(
            child: GridView.count(
              crossAxisCount: Dimens.categoryGridCount,
              children: viewModel.colors.entries.map((element) {
                return CategoryCard(element: element);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModelProvider.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: Dimens.headerFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child) {
            return IconButton(
              onPressed: () {
                viewModel.toggleEditing();
              },
              icon: viewModel.isEditing
                  ? Icon(Icons.save, size: Dimens.headerFontSize)
                  : Icon(Icons.edit, size: Dimens.headerFontSize),
            );
          },
        ),
      ],
    );
  }
}
