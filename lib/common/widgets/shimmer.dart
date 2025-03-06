import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});
  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: (DeviceUtility.isDarkMood(context)
            ? Colors.grey[850]!
            : Colors.grey[300]!),
        highlightColor: (DeviceUtility.isDarkMood(context)
            ? Colors.grey[700]!
            : Colors.grey[100]!),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ??
                  (DeviceUtility.isDarkMood(context)
                      ? CustomColors.darkGrey
                      : CustomColors.grey),
              borderRadius: BorderRadius.circular(radius)),
        ));
  }
}
