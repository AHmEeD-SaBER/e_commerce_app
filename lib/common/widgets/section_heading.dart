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
                          items: [
                            ProductCardVertical(
                              image: ImageStrings.productImage1,
                              title: 'Green Nike Air Shoes',
                              price: 35.5,
                              sale: 25,
                              brand: 'Nike',
                            ),
                            ProductCardVertical(
                              image: ImageStrings.productImage3,
                              title: 'Black Jacket',
                              price: 50.5,
                              sale: 33,
                              brand: 'Adidas',
                            ),
                            ProductCardVertical(
                              image: ImageStrings.productImage4,
                              title: 'Blue Jeans',
                              price: 99.9,
                              sale: 0,
                              brand: 'Zara',
                            ),
                            ProductCardVertical(
                              image: ImageStrings.productImage15,
                              title: 'Iphone 8',
                              price: 300.0,
                              sale: 20,
                              brand: 'Apple',
                            ),
                            ProductCardVertical(
                              image: ImageStrings.productImage11,
                              title: 'Samsung S9',
                              price: 400,
                              sale: 43,
                              brand: 'Samsung',
                            ),
                            ProductCardVertical(
                              image: ImageStrings.productImage21,
                              title: 'Nike Shoes',
                              price: 199.5,
                              sale: 30,
                              brand: 'Nike',
                            )
                          ],
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
