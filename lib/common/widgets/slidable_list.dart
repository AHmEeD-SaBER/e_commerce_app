import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SlidableList extends StatelessWidget {
  const SlidableList({
    super.key,
    required this.image,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.iconColor,
  });
  final String image, title;
  final Color? textColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: backgroundColor ?? CustomColors.borderPrimary,
              ),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Image.asset(
                  image,
                  color: iconColor ?? Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 70,
              child: Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: textColor ?? CustomColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
