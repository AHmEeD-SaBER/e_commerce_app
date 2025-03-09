import 'package:e_commerce_app/common/widgets/brand_container.dart';
import 'package:e_commerce_app/common/widgets/circle_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_price.dart';
import 'package:e_commerce_app/common/widgets/product_title.dart';
import 'package:e_commerce_app/common/widgets/sale_container.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData(
      {super.key, required this.product, required this.brand});
  final Product product;
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    print(brand.icon);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (product.sale > 0)
              SaleContainer(
                amount: '${product.sale}%',
              ),
            if (product.sale > 0)
              SizedBox(
                width: 10,
              ),
            ProductPrice(
              isHorizontal: false,
              bigerDiscountPriceSize: true,
              price: product.price.toString(),
              currency: '\$',
              discount: product.sale,
              widthRatio: 0.5,
            ),
          ],
        ),
        const SizedBox(height: 10),
        ProductTitle(
          title: product.title,
          smallSize: false,
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ProductTitle(
              title: 'In Stock',
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
            CircleImageContainer(image: brand.icon),
            BrandContainer(
              brand: brand,
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
