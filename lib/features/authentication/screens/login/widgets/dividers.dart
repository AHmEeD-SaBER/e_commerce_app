import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Dividers extends StatelessWidget {
  const Dividers({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? CustomColors.darkGrey
                : CustomColors.grey,
            thickness: 0.5,
            endIndent: 5,
            indent: 60,
          ),
        ),
        Text(text,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 12)),
        Flexible(
          child: Divider(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? CustomColors.darkGrey
                : CustomColors.grey,
            thickness: 0.5,
            endIndent: 60,
            indent: 5,
          ),
        ),
      ],
    );
  }
}
