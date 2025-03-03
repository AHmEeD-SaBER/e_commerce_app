import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_images_slider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImagesSlider(
              iamges: [
                ImageStrings.productImage1,
                ImageStrings.productImage2,
                ImageStrings.productImage3,
                ImageStrings.productImage4,
                ImageStrings.productImage5,
                ImageStrings.productImage6,
                ImageStrings.productImage7,
              ],
              height: 450,
            ),
            Padding(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.star5,
                        color: Colors.amber,
                        size: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "4.5",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text: " (200 Reviews)",
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share),
                      ),
                    ],
                  ),
                  ProductMetaData(),
                  SizedBox(
                    height: 10,
                  ),
                  ProductAttribute(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: DeviceUtility.isDarkMood(context)
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SectionHeading(
                    title: 'Description',
                    showActionBtn: false,
                    blacBackGround: true,
                  ),
                  ReadMoreText(
                    'This is the Description of the product description for green nike sleeve less vest. There are more things that can be added to this description. This is the Description of the product description for green nike sleeve less vest. There are more things that can be added to this description. This is the Description of the product description for green nike sleeve less vest. There are more things that can be added to this description. This is the Description of the product description for green nike sleeve less vest. There are more things that can be added to this description.',
                    trimLines: 3,
                    colorClickableText: CustomColors.primaryColor,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      color: CustomColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      color: CustomColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SectionHeading(
                        title: 'Reviews (199)',
                        showActionBtn: false,
                        blacBackGround: true,
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(() => ProductReviews());
                          },
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            size: 24,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
