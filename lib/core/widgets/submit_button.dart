import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';

class CButton extends StatelessWidget {
  const CButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            padding: EdgeInsets.all(Dimens.padding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Text(title, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}