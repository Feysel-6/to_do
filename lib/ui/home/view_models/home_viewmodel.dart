import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
    final List<Color> _colors = [
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.white,
      Colors.blue,
      Colors.pink,
      Colors.orange,
      Colors.black,
      Colors.brown,
      Colors.purple,
      Colors.grey,
    ];

    List<Color> get colors => _colors;
  }
