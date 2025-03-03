import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    super.key,
    required this.brand,
    required this.isVerified,
    this.style,
    this.maxWeight = 100,
  });

  final String brand;
  final bool isVerified;
  final TextStyle? style;
  final double maxWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            brand,
            style: style ?? Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        if (isVerified)
          Icon(
            Iconsax.verify5,
            color: CustomColors.primaryColor,
            size: 15,
          )
      ],
    );
  }
}
