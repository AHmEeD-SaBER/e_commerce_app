import 'package:e_commerce_app/features/personalization/screens/profile/profile_settings.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/whishlist/wish_list.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatinController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          indicatorColor: const Color.fromARGB(146, 0, 221, 181),
          selectedIndex: controller.selectedIndx.value,
          onDestinationSelected: (index) =>
              controller.selectedIndx.value = index,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: DeviceUtility.isDarkMood(context)
                    ? Colors.white
                    : Colors.black,
              ),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(
                  Iconsax.shop,
                  color: DeviceUtility.isDarkMood(context)
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Shop'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.heart,
                  color: DeviceUtility.isDarkMood(context)
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Whishlist'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.user,
                  color: DeviceUtility.isDarkMood(context)
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Profile'),
          ],
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndx.value]),
    );
  }
}

class NavigatinController extends GetxController {
  final selectedIndx = 0.obs;

  final screens = [
    HomeScreen(),
    Store(),
    WishList(),
    ProfileSettingsScreen(),
  ];
}
