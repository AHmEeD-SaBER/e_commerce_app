import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.iconColor,
      this.backGroundColor,
      this.height,
      this.width,
      this.iconSize,
      this.disabled = false});
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backGroundColor;
  final double? height;
  final double? width;
  final double? iconSize;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: disabled
            ? (backGroundColor ?? Colors.grey).withOpacity(0.5)
            : backGroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: disabled ? null : onPressed,
        icon: Icon(
          icon,
          color: disabled
              ? (iconColor ?? Colors.grey).withOpacity(0.5)
              : iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
