import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();
  final currentIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  void skipOnboarding() {
    Get.offAll(() => LoginScreen());
  }

  void dotNaveClick(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void nextPage() {
    if (currentIndex.value < 2) {
      currentIndex.value++;
      pageController.jumpToPage(currentIndex.value);
    } else {
      Get.offAll(LoginScreen());
    }
  }
}
