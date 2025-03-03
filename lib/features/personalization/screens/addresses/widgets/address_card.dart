import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key,
      required this.title,
      required this.phoneNumber,
      this.isSelected = false,
      required this.address});
  final String title;
  final String phoneNumber;
  final String address;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.transparent
            : DeviceUtility.isDarkMood(context)
                ? CustomColors.black
                : CustomColors.grey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected
              ? CustomColors.primaryColor
              : DeviceUtility.isDarkMood(context)
                  ? CustomColors.black
                  : CustomColors.grey,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          if (isSelected)
            Positioned(
              top: 0,
              right: 5,
              child: Icon(
                Iconsax.tick_circle5,
                color: CustomColors.primaryColor,
                size: 24,
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              Text(
                phoneNumber,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 8),
              Text(
                address,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
