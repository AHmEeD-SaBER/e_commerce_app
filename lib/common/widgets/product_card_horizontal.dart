import 'package:e_commerce_app/common/widgets/brand_container.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_price.dart';
import 'package:e_commerce_app/common/widgets/product_title.dart';
import 'package:e_commerce_app/common/widgets/sale_container.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal(
      {super.key,
      required this.title,
      required this.brand,
      required this.price,
      required this.sale,
      required this.image,
      this.onPressed});
  final String title;
  final Brand brand;
  final double price;
  final double sale;
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ??
          () {
            // Get.to(ProductDetails(produc,));
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
                        imageUrl: image,
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
                                title: title,
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
                                  isHorizontal: true,
                                  price: price.toString(),
                                  currency: '\$',
                                  discount: 0.23,
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
              if (sale != 0)
                Positioned(
                  top: 10,
                  left: 10,
                  child: SaleContainer(
                    amount: '$sale%',
                  ),
                ),
              Positioned(
                top: 0,
                right: 0,
                child: CircularIcon(
                  icon: Iconsax.heart,
                  onPressed: () {},
                  iconColor: DeviceUtility.isDarkMood(context)
                      ? CustomColors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
