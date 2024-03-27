// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';

class SettingMenuWidget extends StatelessWidget {
  const SettingMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor, this.iconColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: backGround.withOpacity(0.5),
        ),
        child: Icon(icon, color:iconColor?? baseColor),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
        textScaler: const TextScaler.linear(1.3),
      ),
    );
  }
}
