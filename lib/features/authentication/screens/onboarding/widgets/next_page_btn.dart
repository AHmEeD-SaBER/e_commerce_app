import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPageBtn extends StatelessWidget {
  const NextPageBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Positioned(
      bottom: DeviceUtility.getBottomNavigationBarHeight(context) + 50,
      right: 20,
      child: ElevatedButton(
        onPressed: () {
          controller.nextPage();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: CircleBorder(
            side: BorderSide.none,
          ),
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? CustomColors.primaryColor
                  : CustomColors.dark,
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          color: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? CustomColors.dark
              : CustomColors.light,
        ),
      ),
    );
  }
}
