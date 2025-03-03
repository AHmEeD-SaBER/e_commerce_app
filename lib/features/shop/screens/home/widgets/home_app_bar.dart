import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Day For Shopping',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: CustomColors.darkerGrey),
              ),
              Text(
                'Ahmed Saber',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: CustomColors.white),
              ),
            ],
          ),
          actions: [
            CartCounterIcon(onPressed: () {
              Get.to(() => CartScreen());
            })
          ],
        )
      ],
    );
  }
}
