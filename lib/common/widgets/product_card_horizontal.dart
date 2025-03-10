import 'package:e_commerce_app/common/widgets/brand_container.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_price.dart';
import 'package:e_commerce_app/common/widgets/product_title.dart';
import 'package:e_commerce_app/common/widgets/sale_container.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/products_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal(
      {super.key, required this.product, this.onPressed});
  final Product product;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    final productsController = Get.put(ProductsController());
    if (controller.brands.isEmpty) {
      controller.fetchAllBrands();
    }
    final brand = controller.brands.firstWhereOrNull(
          (brand) => brand.id == product.brandId,
        ) ??
        Brand.empty();
    return GestureDetector(
      onTap: onPressed ??
          () {
            Get.to(ProductDetails(product: product, brand: brand));
          },
      child: Card(
        color: DeviceUtility.isDarkMood(context)
            ? const Color.fromARGB(255, 26, 26, 26)
            : CustomColors.white,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          1,
        ),
        child: SizedBox(
          width: DeviceUtility.getScreenWidth(context) * 0.89,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? const Color.fromARGB(255, 56, 56, 56)
                          : const Color.fromARGB(33, 0, 0, 0),
                    ),
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 120,
                      child: CurvedImageContainer(
                        imageUrl: product.thumbnail,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductTitle(
                                title: product.title,
                                smallSize: true,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              BrandContainer(brand: brand),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 2,
                                child: ProductPrice(
                                  price: product.price.toString(),
                                  currency: '\$',
                                  discount: product.sale,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: DeviceUtility.isDarkMood(context)
                                      ? CustomColors.darkGrey
                                      : CustomColors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Icon(
                                      Iconsax.add,
                                      color: DeviceUtility.isDarkMood(context)
                                          ? Colors.black
                                          : CustomColors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              if (product.sale != 0)
                Positioned(
                  top: 10,
                  left: 10,
                  child: SaleContainer(
                    amount: '${product.sale}%',
                  ),
                ),
              Positioned(
                top: 0,
                right: 0,
                child: Obx(() {
                  final isFav =
                      productsController.isProductFavorite(product.id);
                  return CircularIcon(
                    icon: isFav ? Iconsax.heart5 : Iconsax.heart,
                    onPressed: () async {
                      if (isFav) {
                        await productsController.removeFromFavorite(product.id);
                      } else {
                        await productsController.addToFavorite(product.id);
                      }
                    },
                    iconColor: DeviceUtility.isDarkMood(context)
                        ? CustomColors.white
                        : Colors.black,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
