import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CircleImageContainer extends StatelessWidget {
  const CircleImageContainer({
    super.key,
    this.width = 56,
    this.height = 56,
    this.imageColor,
    required this.image,
  });
  final double width;
  final double height;
  final Color? imageColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: DeviceUtility.isDarkMood(context)
        //     ? CustomColors.black
        //     : CustomColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset(
        fit: BoxFit.contain,
        image,
        color: imageColor ??
            (DeviceUtility.isDarkMood(context)
                ? CustomColors.white
                : CustomColors.black),
      ),
    );
  }
}
