import 'package:flutter/material.dart';

class CurvedImageContainer extends StatelessWidget {
  const CurvedImageContainer(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.border,
      this.isNetworkImage = false,
      this.backGroundColor,
      this.onPressed,
      this.paddingHorizontal = 10,
      this.isFill = false});
  final double? width, height;
  final String imageUrl;
  final BoxBorder? border;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final bool isFill;
  final Color? backGroundColor;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        height: height ?? 200,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: border,
            color: backGroundColor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: isNetworkImage
              ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imageUrl,
                  fit: isFill ? BoxFit.fill : BoxFit.contain,
                  width: double.infinity,
                ),
        ),
      ),
    );
  }
}
