import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title:
            Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Icons.add, onPressed: () {})],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: GridLayOut(items: [
            ProductCardVertical(
              image: ImageStrings.productImage1,
              title: 'Green Nike Air Shoes',
              price: 35.5,
              sale: 25,
              brand: 'Nike',
            ),
            ProductCardVertical(
              image: ImageStrings.productImage2,
              title: 'Jordan Shoes',
              price: 50.5,
              sale: 33,
              brand: 'Nike',
            ),
            ProductCardVertical(
              image: ImageStrings.productImage8,
              title: 'Jordan 1',
              price: 99.9,
              sale: 0,
              brand: 'Nike',
            ),
            ProductCardVertical(
              image: ImageStrings.productImage3,
              title: 'Black Jacket',
              price: 300.0,
              sale: 20,
              brand: 'Adidas',
            ),
            ProductCardVertical(
              image: ImageStrings.productImage5,
              title: 'Sport Shirt',
              price: 400,
              sale: 43,
              brand: 'Adidas',
            ),
            ProductCardVertical(
              image: ImageStrings.productImage26,
              title: 'Training Wear',
              price: 199.5,
              sale: 30,
              brand: 'Adidas',
            )
          ]),
        ),
      ),
    );
  }
}
