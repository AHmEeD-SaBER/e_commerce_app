import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/next_page_btn.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_skip_btn.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/page_indicator.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnboardingPage(
                imagePath: 'assets/images/onboarding/first.json',
                title: 'Choose Your Product',
                description:
                    'Welcome to a World Of Limitlesss Choices - Your Perfect Product Awaits!',
              ),
              OnboardingPage(
                imagePath: 'assets/images/onboarding/second.json',
                title: 'Select Payment Method',
                description:
                    'For Your Convenience, We Offer Multiple Payment Options - Choose the One that Suits You Best!',
              ),
              OnboardingPage(
                imagePath: 'assets/images/onboarding/thrd.json',
                title: 'Track Your Order',
                description:
                    'Stay Updated on Your Order Status - From Processing to Delivery!',
              )
            ],
          ),
          OnboardingSkipBtn(),
          PageIndicator(),
          NextPageBtn()
        ],
      ),
    );
  }
}
