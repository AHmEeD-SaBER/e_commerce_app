import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    super.key,
    required this.brand,
    this.style,
    this.maxWeight = 100,
  });

  final Brand brand;
  final TextStyle? style;
  final double maxWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            brand.name,
            style: style ?? Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        if (brand.isVerified)
          Icon(
            Iconsax.verify5,
            color: CustomColors.primaryColor,
            size: 15,
          )
      ],
    );
  }
}
