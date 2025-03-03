import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';

import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => CartItem(),
                separatorBuilder: (_, __) => SizedBox(
                      height: 26,
                    ),
                itemCount: 12)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => Checkout());
          },
          child: Text(
            'Checkout \$560.99',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                color: DeviceUtility.isDarkMood(context)
                    ? Colors.black
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}
