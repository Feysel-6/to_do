import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';

import '../../../core/dependencies.dart';

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
              children: List.generate(
                viewModel.colors.length,
                (int index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ColoredBox(color: viewModel.colors[index]),
                ),
              ),
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
        Icon(Icons.edit, size: Dimens.headerFontSize),
      ],
    );
  }
}
