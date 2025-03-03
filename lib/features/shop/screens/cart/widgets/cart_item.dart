import 'package:e_commerce_app/common/widgets/brand_container.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_price.dart';
import 'package:e_commerce_app/common/widgets/product_title.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.showRemoveAddButtons = true});

  final bool showRemoveAddButtons;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CurvedImageContainer(
              imageUrl: ImageStrings.productImage1,
              height: 60,
              width: 60,
              isNetworkImage: false,
              backGroundColor: DeviceUtility.isDarkMood(context)
                  ? CustomColors.black
                  : CustomColors.grey,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ProductTitle(
                      title: 'Nike Air Shoes',
                      smallSize: true,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BrandContainer(brand: 'Nike', isVerified: true),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Color',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: ' : Black  ',
                            style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(
                            text: 'Size',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: ' : EU 42',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        if (showRemoveAddButtons)
          SizedBox(
            height: 20,
          ),
        if (showRemoveAddButtons)
          Row(
            children: [
              SizedBox(
                width: 70,
              ),
              CircularIcon(
                icon: Iconsax.minus,
                height: 32,
                width: 32,
                iconSize: 17,
                onPressed: () {},
                backGroundColor: CustomColors.darkGrey,
                iconColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "1",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              CircularIcon(
                icon: Iconsax.add,
                height: 32,
                width: 32,
                iconSize: 17,
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {},
                backGroundColor: CustomColors.primaryColor,
              ),
              Spacer(),
              ProductPrice(price: '230', currency: '\$')
            ],
          ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
