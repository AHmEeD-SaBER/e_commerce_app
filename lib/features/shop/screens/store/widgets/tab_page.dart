import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/category.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/brand_show_case.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class TabPage extends StatelessWidget {
  const TabPage({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              BrandShowCase(
                brand: 'Nike',
                brandImage: 'assets/icons/brands/nike.png',
                noProducts: '234',
                products: [
                  ImageStrings.productImage1,
                  ImageStrings.productImage2,
                  ImageStrings.productImage8,
                ],
                isVerified: T,
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              BrandShowCase(
                brand: 'Adidas',
                brandImage: 'assets/icons/brands/adidas-logo.png',
                noProducts: '234',
                products: [
                  ImageStrings.productImage3,
                  ImageStrings.productImage5,
                  ImageStrings.productImage26,
                ],
                isVerified: T,
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              SectionHeading(
                title: 'You Might Like',
                buttonTitle: 'View All',
                blacBackGround: true,
                showActionBtn: true,
              ),
              SizedBox(
                height: 20,
              ),
              GridLayOut(items: [])
            ],
          ),
        ),
      ],
    );
  }
}
