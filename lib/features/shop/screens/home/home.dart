import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/common/widgets/shimmer.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/products_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/auto_slider.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/search_container.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(ProductsController());
    final userController = Get.put(UserController());

    // Load products if needed
    if (productsController.products.isEmpty) {
      // This will also ensure favorites are loaded
      productsController.fetchFeaturedProducts();
    } else {
      // If products are already loaded, make sure favorites are loaded too
      productsController.ensureFavoritesLoaded();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeCategories(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: AutoSlider(
                images: [
                  'assets/images/sales/sale1.jpeg',
                  'assets/images/sales/sale5.jpeg',
                  'assets/images/sales/sale4.jpeg',
                  'assets/images/sales/sale7.jpeg',
                  'assets/images/sales/sale3.jpeg',
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: SectionHeading(
                      title: 'Popular Now',
                      buttonTitle: 'View More',
                      blacBackGround: true,
                      showActionBtn: true,
                    ),
                  ),
                  Obx(
                    () => productsController.isLoading.value
                        ? ProductShimmer()
                        : GridLayOut(
                            items: productsController.products.map((product) {
                              // print('product id: ' + product.id);
                              // print('favorite products: ' +
                              //     productsController.favoriteProducts
                              //         .toString());
                              // print('is product favorite: ' +
                              //     productsController
                              //         .isProductFavorite(product.id)
                              //         .toString());

                              return Obx(
                                () => ProductCardVertical(
                                  product: product,
                                  isFav: productsController
                                      .isProductFavorite(product.id),
                                  userId: userController.user.value.id,
                                ),
                              );
                            }).toList(),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 310,
        ),
        itemBuilder: (context, indx) => Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: ShimmerEffect(
                  width: double.infinity, height: double.infinity),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
              child: ShimmerEffect(
                  width: double.infinity, height: double.infinity),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
              child: ShimmerEffect(
                  width: double.infinity, height: double.infinity),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
              width: double.infinity,
              child: ShimmerEffect(
                  width: double.infinity, height: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}
