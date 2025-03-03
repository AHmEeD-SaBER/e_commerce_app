import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer(
      {super.key,
      required this.text,
      this.backGroundColor,
      this.blacBackGround = false});
  final String text;
  final Color? backGroundColor;
  final bool blacBackGround;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      width: DeviceUtility.getScreenWidth(context),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backGroundColor ?? Colors.transparent,
        border: Border.all(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? CustomColors.white
                : CustomColors.dark),
      ),
      child: Row(
        children: [
          Icon(Iconsax.search_status),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? blacBackGround
                            ? Colors.white
                            : CustomColors.black
                        : CustomColors.dark),
          )
        ],
      ),
    );
  }
}
