import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/core/themes/dimens.dart';

import '../../core/themes/colors.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimens.settingBorderRadius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _SectionTitle(title: 'Account Setting'),
          _SettingItem(title: 'Authentication', icon: Icons.password,),
          SizedBox(height: Dimens.spaceBetweenSections),
          _SectionTitle(title: 'App Setting'),
          _SettingItem(title: 'Load Data', icon: Icons.cloud_upload,),
          const Spacer(),
          _SyncButton(),
        ],
      ),
    );
  }
}

class _SyncButton extends StatelessWidget {
  const _SyncButton();

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
          child: Text('Sync', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.title, required this.icon,
  });

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.green),
      title: Text(title),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(fontSize: Dimens.headerFontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}