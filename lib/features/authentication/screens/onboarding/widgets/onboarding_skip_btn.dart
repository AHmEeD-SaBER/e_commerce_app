import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingSkipBtn extends StatelessWidget {
  const OnboardingSkipBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Positioned(
      right: 20,
      top: DeviceUtility.getAppBarHeight(),
      child: TextButton(
        onPressed: () {
          controller.skipOnboarding();
        },
        child: Text('Skip', style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
