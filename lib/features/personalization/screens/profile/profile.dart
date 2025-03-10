import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/circle_image_container.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/common/widgets/shimmer.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/field_edit.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Iconsax.close_square4,
                size: 28,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CircleImageContainer(
                  image: 'assets/images/User.gif',
                  width: 90,
                  height: 90,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change Profile Picture',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: CustomColors.primaryColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                SectionHeading(
                  title: 'Profile Information',
                  blacBackGround: true,
                  showActionBtn: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => ProfileEdit(
                    title: 'Name',
                    value: controller.user.value.fullName,
                    onPressed: () {
                      Get.to(() => UpdateName());
                    },
                  ),
                ),
                Obx(
                  () => ProfileEdit(
                    title: 'Username',
                    value: controller.user.value.userName,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                SectionHeading(
                  title: 'Personal Information',
                  blacBackGround: true,
                  showActionBtn: false,
                ),
                Obx(
                  () => ProfileEdit(
                    title: 'User ID',
                    value: controller.user.value.id,
                    onPressed: () {},
                    icon: Iconsax.copy,
                  ),
                ),
                Obx(
                  () => ProfileEdit(
                    title: 'E-mail',
                    value: controller.user.value.email,
                    onPressed: () {},
                  ),
                ),
                ProfileEdit(
                  title: 'Phone Number',
                  value: Formatter.formatPhoneNumber(
                      controller.user.value.phoneNumber),
                  onPressed: () {},
                ),
                ProfileEdit(
                  title: 'Gender',
                  value: 'Male',
                  onPressed: () {},
                ),
                ProfileEdit(
                  title: 'Date of Birth',
                  value: '3 Jun, 2004',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      controller.deletePopupWarning();
                    },
                    child: Text(
                      'Close Account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: CustomColors.error),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({
    super.key,
    required this.title,
    required this.value,
    this.onPressed,
    this.icon = Iconsax.arrow_right,
  });
  final String title;
  final String value;
  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return controller.userLoading.value
        ? ShimmerEffect(width: double.infinity, height: 15)
        : Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ),
              if (onPressed != null)
                IconButton(
                  onPressed: () {
                    onPressed!();
                  },
                  icon: Icon(icon),
                  color: CustomColors.primaryColor,
                )
            ],
          );
  }
}
