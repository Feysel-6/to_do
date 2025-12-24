import 'package:flutter/material.dart';

import '../../../core/dependencies.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.element});

  final MapEntry<Color, String> element;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.element.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModelProvider.of(context);
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, _) {
        return InkWell(
          onTap: viewModel.isEditing
              ? null
              : () {
            viewModel.selectCategory(widget.element.value);
            Navigator.of(context).pop();
          },
          child: Card(
            child: ColoredBox(
              color: widget.element.key,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) =>
                      viewModel.updateName(widget.element.key, value),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  enabled: viewModel.isEditing,
                  decoration: InputDecoration(
                    hintText:
                    widget.element.value[0].toUpperCase() +
                        widget.element.value.substring(1),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    border: viewModel.isEditing
                        ? UnderlineInputBorder()
                        : InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
