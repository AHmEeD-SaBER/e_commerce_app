import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/reviews_controller.dart';
import 'package:e_commerce_app/features/shop/models/review.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews(
      {super.key, required this.reviews, required this.rating});
  final List<Review> reviews;
  final double rating;

  @override
  Widget build(BuildContext context) {
    print('reviews: $reviews');
    final userController = Get.put(UserController());
    final reviewsController = Get.put(ReviewsController());
    reviewsController.getRatingMap();
    for (final entry in reviewsController.ratingMap.entries) {
      print(entry.key);
      print(entry.value);
    }
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
                      child: Text(rating.toString(),
                          style: Theme.of(context).textTheme.displayLarge)),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        RatingProgressIndicator(
                          rating: '5',
                          value: (reviewsController.ratingMap[5] ?? 0) /
                              reviewsController.reviews.length,
                        ),
                        RatingProgressIndicator(
                          rating: '4',
                          value: (reviewsController.ratingMap[4] ?? 0) /
                              reviewsController.reviews.length,
                        ),
                        RatingProgressIndicator(
                          rating: '3',
                          value: (reviewsController.ratingMap[3] ?? 0) /
                              reviewsController.reviews.length,
                        ),
                        RatingProgressIndicator(
                          rating: '2',
                          value: (reviewsController.ratingMap[2] ?? 0) /
                              reviewsController.reviews.length,
                        ),
                        RatingProgressIndicator(
                          rating: '1',
                          value: (reviewsController.ratingMap[1] ?? 0) /
                              reviewsController.reviews.length,
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
                reviewsController.reviews.length.toString(),
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
                        review: reviewsController.reviews[indx],
                        isResponse:
                            reviewsController.reviews[indx].sellerReview !=
                                null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                    ],
                  ),
                ),
                itemCount: reviewsController.reviews.length,
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
