import 'package:e_commerce_app/common/widgets/brand_container.dart';
import 'package:e_commerce_app/common/widgets/circle_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_price.dart';
import 'package:e_commerce_app/common/widgets/product_title.dart';
import 'package:e_commerce_app/common/widgets/sale_container.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SaleContainer(amount: '24%', obacity: 255),
            const SizedBox(width: 15),
            ProductPrice(
              price: '234',
              currency: '\$',
              isDiscounted: true,
              discount: 0.24,
            ),
          ],
        ),
        const SizedBox(height: 10),
        ProductTitle(
          title: 'Nike Shoes',
          smallSize: false,
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ProductTitle(
              title: 'Status',
              smallSize: true,
              maxLines: 1,
            ),
            const SizedBox(width: 10),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.green,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleImageContainer(image: 'assets/icons/brands/nike.png'),
            BrandContainer(
              brand: 'Nike',
              isVerified: true,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
