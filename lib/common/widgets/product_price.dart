import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    required this.currency,
    this.widthRatio = 0.3,
    this.bigerDiscountPriceSize = false,
    this.discount = 0.0,
    this.isHorizontal = true,
  });
  final String price;
  final String currency;
  final double discount;
  final bool bigerDiscountPriceSize;
  final double widthRatio;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final bool isDiscounted = (discount > 0);
    if (isHorizontal) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              '$currency$price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  decoration: isDiscounted ? TextDecoration.lineThrough : null,
                  color: isDiscounted ? CustomColors.darkGrey : null),
            ),
          ),
          if (isDiscounted)
            const SizedBox(
              width: 5,
            ),
          if (isDiscounted)
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * widthRatio),
              child: Text(
                '$currency${(double.parse(price) - (double.parse(price) * (discount / 100))).toStringAsFixed(2)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: bigerDiscountPriceSize
                    ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.bold)
                    : Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(
            height: 5,
          ),
        ],
      );
    }
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100),
          child: Text(
            '$currency$price',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                decoration: isDiscounted ? TextDecoration.lineThrough : null,
                color: isDiscounted ? CustomColors.darkGrey : null),
          ),
        ),
        if (isDiscounted)
          const SizedBox(
            width: 5,
          ),
        if (isDiscounted)
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * widthRatio),
            child: Text(
              '$currency${(double.parse(price) - (double.parse(price) * (discount / 100))).toStringAsFixed(2)}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: bigerDiscountPriceSize
                  ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: CustomColors.primaryColor,
                      fontWeight: FontWeight.bold)
                  : Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: CustomColors.primaryColor,
                      fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
