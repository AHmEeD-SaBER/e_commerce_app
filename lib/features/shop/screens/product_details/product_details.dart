import 'package:e_commerce_app/features/shop/controllers/attribute_sellector.dart';
import 'package:e_commerce_app/features/shop/controllers/reviews_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_images_slider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/add_review.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product, required this.brand});
  final Product product;
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    final reviewsController = Get.put(ReviewsController());
    reviewsController.getReviews(product.id);
    // Initialize the controller with this product
    final controller = Get.put(AttributeSellector());
    // Set the product variations for availability checks
    controller.setVariations(product.variations);
    // Set the current product ID
    controller.setCurrentProductId(product.id);

    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImagesSlider(
              iamges: List<String>.from(product.images),
              thumbnail: product.thumbnail,
              productId: product.id,
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
                              text: product.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  " (${reviewsController.reviews.length}) Reviews",
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Get.to(() => AddReview());
                        },
                        icon: Icon(
                          Icons.rate_review,
                          color: CustomColors.primaryColor,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  ProductMetaData(
                    product: product,
                    brand: brand,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProductAttribute(
                    product: product,
                  ),
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
                    title: product.title,
                    showActionBtn: false,
                    blacBackGround: true,
                  ),
                  ReadMoreText(
                    product.description,
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
                        title:
                            'Reviews (${reviewsController.getTotalReviews(product.id)})',
                        showActionBtn: false,
                        blacBackGround: true,
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(() => ProductReviews(
                                  reviews: reviewsController.reviews,
                                  rating: product.rating,
                                ));
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
