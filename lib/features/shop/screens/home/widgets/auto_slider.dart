import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widgets/circle_container.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/features/shop/controllers/home_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AutoSlider extends StatelessWidget {
  const AutoSlider({
    super.key,
    required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayCurve: Curves.easeIn,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            height: 230,
            onPageChanged: (index, reason) =>
                controller.onCarousalChange(index),
            viewportFraction: 1,
          ),
          items: [
            for (int i = 0; i < images.length; i++)
              CurvedImageContainer(
                isFill: T,
                imageUrl: images[i],
                isNetworkImage: false,
                height: 230,
              ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < images.length; i++)
                CircleContainer(
                    heigt: 3,
                    width: 20,
                    padding: 0,
                    margin: EdgeInsets.only(right: 5),
                    color: controller.currentCarousalIndex.value == i
                        ? CustomColors.darkGrey
                        : CustomColors.primaryColor),
            ],
          ),
        )
      ],
    );
  }
}
