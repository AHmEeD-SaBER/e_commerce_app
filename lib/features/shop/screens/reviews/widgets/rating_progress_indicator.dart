import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.value,
    required this.rating,
  });
  final double value;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(rating, style: Theme.of(context).textTheme.bodyMedium),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 11,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              borderRadius: BorderRadius.circular(7),
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(CustomColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
