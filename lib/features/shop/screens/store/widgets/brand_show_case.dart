import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/brand_card.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.brand,
    required this.onPressed,
    required this.products,
  });
  final Brand brand;
  final VoidCallback onPressed;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    print(products.length);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            width: 3,
            color: DeviceUtility.isDarkMood(context)
                ? const Color.fromARGB(255, 78, 78, 78)
                : CustomColors.grey),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: BrandCard(
              brand: brand,
              showBorders: false,
              onPressed: onPressed,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              for (int i = 0; i < products.length; i++)
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: DeviceUtility.isDarkMood(context)
                          ? CustomColors.black
                          : const Color.fromARGB(255, 223, 223, 223),
                    ),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                    child: Image.asset(
                      products[i].thumbnail,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
