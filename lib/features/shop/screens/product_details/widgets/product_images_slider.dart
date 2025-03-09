import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/custom_clip_path.dart';
import 'package:e_commerce_app/features/shop/controllers/products_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({
    super.key,
    required this.iamges,
    required this.thumbnail,
    required this.productId,
  });
  final List<String> iamges;
  final String thumbnail;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImgSliderController());
    final productsController = Get.put(ProductsController());

    return CustomClipPath(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: DeviceUtility.isDarkMood(context)
              ? CustomColors.darkerGrey
              : CustomColors.grey,
        ),
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    margin:
                        EdgeInsets.only(top: DeviceUtility.getAppBarHeight()),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Image.asset(iamges[controller.current]),
                      ),
                    ),
                  ),
                  CustomAppbar(
                    showBackArrow: true,
                    actions: [
                      Obx(() {
                        final isFav =
                            productsController.isProductFavorite(productId);
                        return CircularIcon(
                          icon: isFav ? Iconsax.heart5 : Iconsax.heart,
                          onPressed: () async {
                            if (isFav) {
                              await productsController
                                  .removeFromFavorite(productId);
                            } else {
                              await productsController.addToFavorite(productId);
                            }
                          },
                          iconColor: DeviceUtility.isDarkMood(context)
                              ? CustomColors.white
                              : CustomColors.black,
                        );
                      })
                    ],
                  ),
                ],
              ),
              Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 30, left: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, indx) => GestureDetector(
                    onTap: () {
                      controller.setCurrent(indx);
                    },
                    child: CurvedImageContainer(
                      imageUrl: iamges[indx],
                      width: 90,
                      height: 90,
                      backGroundColor: DeviceUtility.isDarkMood(context)
                          ? CustomColors.black
                          : const Color.fromARGB(255, 187, 187, 187),
                      border: Border.all(
                          color: controller.current == indx
                              ? CustomColors.primaryColor
                              : Colors.transparent,
                          width: 1),
                    ),
                  ),
                  separatorBuilder: (context, indx) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: iamges.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImgSliderController extends GetxController {
  static ImgSliderController get instance => Get.find();
  final _current = 0.obs;

  int get current => _current.value;

  void setCurrent(int index) {
    _current.value = index;
  }
}
