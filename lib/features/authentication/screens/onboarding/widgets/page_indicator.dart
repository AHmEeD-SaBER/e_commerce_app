import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Positioned(
      bottom: 150,
      left: 30,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNaveClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? CustomColors.primaryColor
                  : CustomColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
