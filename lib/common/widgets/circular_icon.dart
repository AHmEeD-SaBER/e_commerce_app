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
      this.iconSize});
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backGroundColor;
  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backGroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
