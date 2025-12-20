import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';

import '../../core/themes/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person_off, color: AppColors.green),
      title: const Text('User'),
      trailing: Icon(Icons.edit, color: AppColors.green,),
      contentPadding: EdgeInsets.all(Dimens.padding),
    );
  }
}