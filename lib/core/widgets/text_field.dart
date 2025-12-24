import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';

class CTextField extends StatelessWidget {
  const CTextField({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(8),
          focusColor: Colors.white,
          prefixIcon:  Icon(icon,),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
