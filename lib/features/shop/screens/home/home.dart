import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/auto_slider.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/search_container.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final products = [
    ProductCardVertical(
      image: ImageStrings.productImage1,
      title: 'Green Nike Air Shoes',
      price: 35.5,
      sale: 25,
      brand: 'Nike',
    ),
    ProductCardVertical(
      image: ImageStrings.productImage3,
      title: 'Black Jacket',
      price: 50.5,
      sale: 33,
      brand: 'Adidas',
    ),
    ProductCardVertical(
      image: ImageStrings.productImage4,
      title: 'Blue Jeans',
      price: 99.9,
      sale: 0,
      brand: 'Zara',
    ),
    ProductCardVertical(
      image: ImageStrings.productImage15,
      title: 'Iphone 8',
      price: 300.0,
      sale: 20,
      brand: 'Apple',
    ),
    ProductCardVertical(
      image: ImageStrings.productImage11,
      title: 'Samsung S9',
      price: 400,
      sale: 43,
      brand: 'Samsung',
    ),
    ProductCardVertical(
      image: ImageStrings.productImage21,
      title: 'Nike Shoes',
      price: 199.5,
      sale: 30,
      brand: 'Nike',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeCategories(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: AutoSlider(
                images: [
                  'assets/images/sales/sale1.jpeg',
                  'assets/images/sales/sale5.jpeg',
                  'assets/images/sales/sale2.jpeg',
                  'assets/images/sales/sale4.jpeg',
                  'assets/images/sales/sale7.jpeg',
                  'assets/images/sales/sale3.jpeg',
                  'assets/images/sales/sale6.jpeg',
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: SectionHeading(
                      title: 'Popular Now',
                      buttonTitle: 'View More',
                      blacBackGround: true,
                      showActionBtn: true,
                    ),
                  ),
                  GridLayOut(items: products),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
