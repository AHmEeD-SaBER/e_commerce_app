import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trailing,
      required this.icon,
      this.onPressed});
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      leading: Icon(
        icon,
        size: 28,
        color: CustomColors.primaryColor,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onPressed,
    );
  }
}
