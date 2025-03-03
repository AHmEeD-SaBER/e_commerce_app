import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CuponContainer extends StatelessWidget {
  const CuponContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: DeviceUtility.isDarkMood(context) ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: DeviceUtility.isDarkMood(context)
                ? Colors.white
                : Colors.black),
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Have a promo code? Enter here',
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: DeviceUtility.isDarkMood(context)
                    ? const Color.fromARGB(164, 35, 35, 35)
                    : const Color.fromARGB(160, 224, 224, 224),
              ),
              onPressed: () {},
              child: Text(
                'Apply',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: DeviceUtility.isDarkMood(context)
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
