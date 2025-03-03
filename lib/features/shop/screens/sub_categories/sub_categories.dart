import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Sports Shirts',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              CurvedImageContainer(
                width: double.infinity,
                paddingHorizontal: 0,
                imageUrl: 'assets/images/sales/sale1.jpeg',
                isFill: true,
              ),
              SizedBox(height: 30),
              ProductsSection(
                title: 'Sports Shoes',
              ),
              SizedBox(height: 30),
              ProductsSection(
                title: 'Furniture',
              ),
              SizedBox(height: 30),
              ProductsSection(
                title: 'Clothes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: title,
          showActionBtn: true,
          buttonTitle: 'view all',
          blacBackGround: true,
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.separated(
            itemBuilder: (_, indx) => ProductCardHorizontal(
                title: 'Nike Shoes',
                brand: 'Nike',
                price: 34.63,
                sale: 23,
                image: ImageStrings.productImage1),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 16),
          ),
        )
      ],
    );
  }
}
