import 'package:e_commerce_app/features/shop/controllers/reviews_controller.dart';
import 'package:e_commerce_app/features/shop/models/review.dart';
import 'package:e_commerce_app/features/shop/screens/reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.review,
    this.onInfoPressed,
    required this.isResponse,
  });
  final Review review;
  final VoidCallback? onInfoPressed;
  final bool isResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: CustomColors.darkGrey,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  review.userName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: onInfoPressed,
              icon: Icon(
                Icons.more_vert,
                color: DeviceUtility.isDarkMood(context)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CustomRatingBar(rating: review.rating.toDouble()),
            SizedBox(
              width: 10,
            ),
            Text(
              review.date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ReadMoreText(
          review.review,
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Read less',
          moreStyle: Theme.of(context).textTheme.titleLarge,
          lessStyle: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 20,
        ),
        if (isResponse && review.sellerReview != null)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: DeviceUtility.isDarkMood(context)
                  ? CustomColors.black
                  : CustomColors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.sellerReview!.userName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      review.sellerReview!.date,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  review.sellerReview!.review,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CustomColors.primaryColor),
                  lessStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CustomColors.primaryColor),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
