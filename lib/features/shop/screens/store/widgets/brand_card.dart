import 'package:e_commerce_app/common/widgets/brand_container.dart';
import 'package:e_commerce_app/common/widgets/circle_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BrandCard extends StatelessWidget {
  const BrandCard(
      {super.key,
      required this.name,
      this.isVerified = T,
      required this.noProducts,
      required this.brandImage,
      this.showBorders = true,
      this.borderWeight = 2,
      this.maxWeight = 100,
      this.onPressed});
  final String name;
  final bool isVerified;
  final String noProducts;
  final String brandImage;
  final VoidCallback? onPressed;
  final bool showBorders;
  final double borderWeight;
  final double maxWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ??
          () {
            Get.to(() => AllScreen(
                  items: [],
                  showFilterBar: true,
                  title: 'Nike',
                  showBrand: true,
                ));
          },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: showBorders
              ? Border.all(
                  width: borderWeight,
                  color: DeviceUtility.isDarkMood(context)
                      ? CustomColors.black
                      : CustomColors.grey,
                )
              : null,
          color: Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: CircleImageContainer(
                image: brandImage,
                height: 60,
                width: 60,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // BrandContainer(
                  //   brand: name,
                  //   maxWeight: maxWeight,
                  //   isVerified: isVerified,
                  //   style: Theme.of(context).textTheme.titleLarge,
                  // ),
                  Text(
                    '$noProducts Products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
