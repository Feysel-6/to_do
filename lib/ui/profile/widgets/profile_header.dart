import 'package:flutter/material.dart';
import 'package:flutter_mapp/core/widgets/submit_button.dart';
import '../../../core/assets.dart';
import '../../../core/widgets/text_field.dart';
import '../../core/themes/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => _openSignUp(context),
            mouseCursor: SystemMouseCursors.click,
            child: Row(
              children: [
                Icon(Icons.person_off, color: AppColors.green),
                SizedBox(width: 12),
                const Text('User'),
              ],
            ),
          ),
          IconButton(
            mouseCursor: SystemMouseCursors.click,
            onPressed: null,
            icon: Icon(Icons.edit, color: AppColors.green),
          ),
        ],
      ),
    );
  }

  void _openSignUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CTextField(label: 'Username', icon: Icons.alternate_email,),
            CTextField(label: 'Password', icon: Icons.password,),
            CButton(title: 'Submit'),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Text('Sign In with Google'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: null,
                hoverColor: Colors.grey,
                mouseCursor: SystemMouseCursors.click,
                child: CircleAvatar(child: Image.asset(Assets.googleLogo)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}