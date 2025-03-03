import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/custom_clip_path.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({
    super.key,
    required this.iamges,
    this.height,
  });
  final List<String> iamges;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CustomClipPath(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: DeviceUtility.isDarkMood(context)
              ? CustomColors.darkerGrey
              : CustomColors.grey,
        ),
        child: Stack(
          children: [
            Container(
              height: height,
              margin: const EdgeInsets.only(bottom: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(ImageStrings.productImage1),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 24,
              right: 24,
              child: Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 30),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, indx) => CurvedImageContainer(
                    imageUrl: iamges[indx],
                    width: 90,
                    height: 90,
                    backGroundColor: DeviceUtility.isDarkMood(context)
                        ? CustomColors.black
                        : const Color.fromARGB(255, 187, 187, 187),
                    border: Border.all(color: CustomColors.black, width: 1),
                  ),
                  separatorBuilder: (context, indx) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: 7,
                ),
              ),
            ),
            CustomAppbar(
              showBackArrow: true,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Iconsax.heart))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
