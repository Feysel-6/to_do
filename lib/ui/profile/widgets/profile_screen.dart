import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/profile/widgets/profile_header.dart';
import 'package:flutter_mapp/ui/profile/widgets/settings_container.dart';

import '../../core/themes/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          ProfileHeader(),
          Expanded(
            child: SettingsContainer(),
          ),
        ],
      ),
    );
  }
}

