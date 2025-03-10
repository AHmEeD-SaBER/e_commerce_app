import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the AttributeSellector controller
    final controller = Get.find<AttributeSellector>();

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
          // Quantity controls
          Row(
            children: [
              // Decrement button
              Obx(() {
                return CircularIcon(
                  icon: Iconsax.minus,
                  height: 40,
                  width: 40,
                  onPressed: () => controller.decrementQuantity(),
                  backGroundColor: CustomColors.darkGrey,
                  iconColor: Colors.black,
                  disabled: controller.quantity.value <= 1,
                );
              }),
              SizedBox(
                width: 15,
              ),
              // Quantity display
              Obx(() => Text(
                    "${controller.quantity.value}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: 15,
              ),
              // Increment button
              Obx(() {
                final maxQuantity = controller.getMaxAvailableQuantity();
                final canIncrement =
                    controller.selectedVariation.value != null &&
                        controller.quantity.value < maxQuantity;

                return CircularIcon(
                  icon: Iconsax.add,
                  height: 40,
                  width: 40,
                  onPressed: () => controller.incrementQuantity(),
                  backGroundColor: CustomColors.primaryColor,
                  iconColor: Colors.black,
                  disabled: !canIncrement,
                );
              }),
            ],
          ),
          // Add to Cart button
          Obx(() {
            final isAddingToCart = controller.isAddingToCart.value;
            final isAvailable = controller.isAvailable.value;

            return ElevatedButton.icon(
              onPressed: isAvailable && !isAddingToCart
                  ? () {
                      controller.addToCart();
                      Helper.showSnackBar(
                          context, 'Added to cart successfully!');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                backgroundColor:
                    isAvailable ? Theme.of(context).primaryColor : Colors.grey,
                disabledBackgroundColor: Colors.grey,
              ),
              label: Text(
                isAddingToCart ? 'Adding...' : 'Add to Cart',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: DeviceUtility.isDarkMood(context)
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              icon: isAddingToCart
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          DeviceUtility.isDarkMood(context)
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    )
                  : Icon(
                      Iconsax.shopping_cart,
                      color: DeviceUtility.isDarkMood(context)
                          ? Colors.black
                          : Colors.white,
                    ),
            );
          }),
        ],
      ),
    );
  }
}
