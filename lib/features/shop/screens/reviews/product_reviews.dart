import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title:
            Text('Reviews', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: T,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and Reviews are Verified and are from Peoeples who have bought this product',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text('4.5',
                          style: Theme.of(context).textTheme.displayLarge)),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        RatingProgressIndicator(
                          rating: '5',
                          value: 0.8,
                        ),
                        RatingProgressIndicator(
                          rating: '4',
                          value: 0.7,
                        ),
                        RatingProgressIndicator(
                          rating: '3',
                          value: 0.6,
                        ),
                        RatingProgressIndicator(
                          rating: '2',
                          value: 0.5,
                        ),
                        RatingProgressIndicator(
                          rating: '1',
                          value: 0.4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomRatingBar(
                rating: 4.5,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 24,
              ),
              ListView.builder(
                itemBuilder: (_, indx) => Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      UserReviewCard(
                          review:
                              'This is a very good product. I am very happy with the product. I will recommend this product to my friends and family. This is a very good product. I am very happy with the product. I will recommend this product to my friends and family.',
                          isResponse: true,
                          sellerName: 'Seller',
                          userName: 'Ahmed Saber',
                          rating: 4.5,
                          date: '12/12/2021',
                          sellerReview:
                              'Thank you for your review. We are happy that you are satisfied with our product. We hope to see you again. Thank you for your review. We are happy that you are satisfied with our product. We hope to see you again.',
                          sellerReviewDate: '12/12/2021'),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                    ],
                  ),
                ),
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        itemBuilder: (context, index) {
          return Icon(
            Iconsax.star1,
            color: CustomColors.primaryColor,
          );
        },
        itemSize: 20,
        unratedColor: Colors.grey,
        rating: rating);
  }
}
