import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce_app/common/widgets/shimmer.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
                    .copyWith(color: CustomColors.dark),
              ),
              SizedBox(height: 5),
              Obx(
                () => controller.userLoading.value
                    ? ShimmerEffect(
                        width: 150,
                        height: 15,
                      )
                    : Text(
                        'Welcome, ${controller.user.value.fullName}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: CustomColors.white),
                      ),
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
