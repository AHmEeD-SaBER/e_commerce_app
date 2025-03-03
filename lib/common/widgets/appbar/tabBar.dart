import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: !DeviceUtility.isDarkMood(context)
                ? CustomColors.grey
                : const Color.fromARGB(255, 27, 27, 27)),
        child: TabBar(
          tabs: tabs,
          indicatorColor: CustomColors.primaryColor,
          indicatorPadding: EdgeInsets.only(bottom: 5),
          labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          labelColor: DeviceUtility.isDarkMood(context)
              ? CustomColors.primaryColor
              : const Color.fromARGB(255, 0, 0, 0),
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          unselectedLabelColor: DeviceUtility.isDarkMood(context)
              ? Colors.white
              : const Color.fromARGB(255, 66, 66, 66),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppBarHeight());
}
