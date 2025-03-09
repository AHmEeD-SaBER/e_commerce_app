import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/features/shop/controllers/products_controller.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:lottie/lottie.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(ProductsController());
    final userController = Get.put(UserController());
    if (productsController.favoriteProducts.isEmpty) {
      productsController.fetchFavoriteProducts(userController.user.value.id);
    }
    final favoriteProducts = productsController.favoriteProducts;
    return Scaffold(
      appBar: CustomAppbar(
        title:
            Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Icons.add, onPressed: () {})],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Obx(
            () => productsController.isLoading.value
                ? ProductShimmer()
                : favoriteProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 50),
                            Lottie.asset('assets/images/empty_wishlist.json',
                                repeat: false, width: 300, height: 300),
                            Text('No products in your wishlist'),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Get.to(() => AllScreen());
                                },
                                child: Text('Add Products',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: DeviceUtility.isDarkMood(
                                                    context)
                                                ? CustomColors.black
                                                : CustomColors.white)),
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridLayOut(
                        items: favoriteProducts.map((productId) {
                          final product = productsController.products
                              .firstWhere((product) => product.id == productId);
                          return ProductCardVertical(
                              product: product,
                              isFav: productsController
                                  .isProductFavorite(productId),
                              userId: userController.user.value.id);
                        }).toList(),
                      ),
          ),
        ),
      ),
    );
  }
}
