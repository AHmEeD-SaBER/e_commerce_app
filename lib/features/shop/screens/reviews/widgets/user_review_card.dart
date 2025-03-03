import 'package:e_commerce_app/features/shop/screens/reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard(
      {super.key,
      required this.review,
      required this.date,
      required this.sellerName,
      required this.sellerReview,
      required this.sellerReviewDate,
      required this.userName,
      required this.rating,
      this.onInfoPressed,
      this.userImage,
      this.isResponse = false});
  final String review;
  final String date;
  final String sellerName;
  final String sellerReview;
  final String sellerReviewDate;
  final String userName;
  final String? userImage;
  final double rating;
  final bool isResponse;
  final VoidCallback? onInfoPressed;
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
                  backgroundImage:
                      AssetImage(userImage ?? 'assets/images/user.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  userName,
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
            CustomRatingBar(rating: rating),
            SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ReadMoreText(
          review,
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
                      sellerName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      sellerReviewDate,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  sellerReview,
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
            )),
      ],
    );
  }
}
