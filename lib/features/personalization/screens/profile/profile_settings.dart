import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/screens/addresses/address.dart';
import 'package:e_commerce_app/features/personalization/screens/orders/orders.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_tile.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/settings_menu_tile.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:iconsax/iconsax.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  ProfileTile(
                    title: 'Ahmed Saber',
                    subtitle: 'ahmad@fcai.com',
                    onPressed: () {
                      Get.to(Profile());
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  SectionHeading(
                    title: 'Account Settings',
                    blacBackGround: true,
                    showActionBtn: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingsMenuTile(
                    title: 'My Address',
                    subtitle: 'Set shopping delivery address',
                    icon: Iconsax.safe_home,
                    onPressed: () {
                      Get.to(() => AddressScreen());
                    },
                  ),
                  SettingsMenuTile(
                    title: 'My Cart',
                    subtitle: 'View your cart items',
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Iconsax.shopping_cart,
                  ),
                  SettingsMenuTile(
                    title: 'My Orders',
                    subtitle: 'In-progress, delivered orders',
                    onPressed: () => Get.to(() => OrdersScreen()),
                    icon: Iconsax.shopping_bag,
                  ),
                  SettingsMenuTile(
                    title: 'Bank Account',
                    subtitle: 'Set your bank account',
                    icon: Iconsax.card,
                  ),
                  SettingsMenuTile(
                    title: 'My Coupons',
                    subtitle: 'List of your discount coupons',
                    icon: Iconsax.discount_shape,
                  ),
                  SettingsMenuTile(
                    title: 'Notifications',
                    subtitle: 'Set your notifications',
                    icon: Iconsax.notification,
                  ),
                  SettingsMenuTile(
                    title: 'Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    icon: Iconsax.security_safe,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SectionHeading(
                    title: 'App Settings',
                    blacBackGround: true,
                    showActionBtn: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingsMenuTile(
                    title: 'Geolocation',
                    subtitle: 'Set recommendations based on location',
                    icon: Iconsax.location,
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                      activeColor: CustomColors.primaryColor,
                      activeTrackColor: const Color.fromARGB(117, 0, 221, 181),
                      inactiveThumbColor: CustomColors.dark,
                      inactiveTrackColor: CustomColors.grey,
                    ),
                  ),
                  SettingsMenuTile(
                    title: 'Safe Mode',
                    subtitle: 'Seasrch result is safe for all ages',
                    icon: Iconsax.shield_cross,
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                      activeColor: CustomColors.primaryColor,
                      activeTrackColor: const Color.fromARGB(117, 0, 221, 181),
                      inactiveThumbColor: CustomColors.dark,
                      inactiveTrackColor: CustomColors.grey,
                    ),
                  ),
                  SettingsMenuTile(
                    title: 'Language',
                    subtitle: 'Set your app language',
                    icon: Iconsax.global,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: CustomColors.error,
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Sign Out'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
