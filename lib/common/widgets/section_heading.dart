import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = '',
    this.textColor,
    this.blacBackGround = false,
    this.showActionBtn = true,
    this.onPressed,
    this.paddingLeft,
    this.paddingRigth,
    this.paddingTop,
    this.paddingBottom,
  });
  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionBtn;
  final bool blacBackGround;
  final void Function()? onPressed;
  final double? paddingLeft;
  final double? paddingRigth;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingLeft ?? 0,
          right: paddingRigth ?? 0,
          top: paddingTop ?? 0,
          bottom: paddingBottom ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: textColor ??
                    (blacBackGround
                        ? DeviceUtility.isDarkMood(context)
                            ? CustomColors.white
                            : CustomColors.black
                        : CustomColors.black)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionBtn)
            TextButton(
              onPressed: onPressed ??
                  () {
                    Get.to(() => AllScreen(
                          title: 'All Products',
                          showFilterBar: true,
                          items: [],
                        ));
                  },
              child: Text(
                buttonTitle,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: blacBackGround
                        ? DeviceUtility.isDarkMood(context)
                            ? CustomColors.white
                            : CustomColors.black
                        : CustomColors.black),
              ),
            ),
        ],
      ),
    );
  }
}
