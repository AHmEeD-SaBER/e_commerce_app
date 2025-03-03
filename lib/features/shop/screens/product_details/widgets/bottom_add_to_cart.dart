import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      decoration: BoxDecoration(
        color: DeviceUtility.isDarkMood(context)
            ? CustomColors.black
            : CustomColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                height: 40,
                width: 40,
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
                height: 40,
                width: 40,
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {},
                backGroundColor: CustomColors.primaryColor,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
            label: Text(
              'Add to Cart',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: DeviceUtility.isDarkMood(context)
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              Iconsax.shopping_cart,
              color: DeviceUtility.isDarkMood(context)
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
