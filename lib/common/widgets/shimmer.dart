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
            ? const Color.fromARGB(172, 143, 143, 143)!
            : const Color.fromARGB(206, 224, 224, 224)!),
        highlightColor: (DeviceUtility.isDarkMood(context)
            ? const Color.fromARGB(167, 97, 97, 97)!
            : const Color.fromARGB(207, 245, 245, 245)!),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ??
                  (DeviceUtility.isDarkMood(context)
                      ? const Color.fromARGB(125, 224, 224, 224)
                      : const Color.fromARGB(188, 224, 224, 224)),
              borderRadius: BorderRadius.circular(radius)),
        ));
  }
}
