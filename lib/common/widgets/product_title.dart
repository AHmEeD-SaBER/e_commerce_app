import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.title,
    required this.smallSize,
    required this.maxLines,
    this.align,
  });
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: smallSize
          ? Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 15)
          : Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
      overflow: TextOverflow.ellipsis,
      textAlign: align,
    );
  }
}
