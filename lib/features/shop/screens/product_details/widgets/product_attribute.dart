import 'package:e_commerce_app/common/widgets/custom_choice_chip.dart';
import 'package:e_commerce_app/common/widgets/product_price.dart';
import 'package:e_commerce_app/common/widgets/product_title.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DeviceUtility.isDarkMood(context)
                ? CustomColors.black
                : CustomColors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SectionHeading(
                    title: 'Variations',
                    showActionBtn: false,
                    blacBackGround: true,
                    paddingTop: 15,
                    paddingBottom: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductPrice(
                        price: '234',
                        bigerDiscountPriceSize: false,
                        currency: '\$',
                        isDiscounted: true,
                        discount: 0.24,
                      ),
                      Row(
                        children: [
                          ProductTitle(
                            title: 'stock',
                            smallSize: true,
                            maxLines: 1,
                          ),
                          const SizedBox(width: 10),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'This is the Description of the product',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'Colors',
              showActionBtn: false,
              blacBackGround: true,
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                CustomChoiceChip(
                  label: 'red',
                  selected: true,
                  onTap: (value) {},
                ),
                CustomChoiceChip(
                  label: 'blue',
                  selected: false,
                  onTap: (value) {},
                ),
                CustomChoiceChip(
                  label: 'green',
                  selected: false,
                  onTap: (value) {},
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'Size',
              showActionBtn: false,
              blacBackGround: true,
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              children: [
                CustomChoiceChip(
                  label: 'EU 34',
                  selected: true,
                  onTap: (value) {},
                ),
                CustomChoiceChip(
                  label: 'Eu 36',
                  selected: false,
                  onTap: (value) {},
                ),
                CustomChoiceChip(
                  label: 'EU 38',
                  selected: false,
                  onTap: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
