import 'package:flutter/material.dart';

class GridLayOut extends StatelessWidget {
  const GridLayOut({
    super.key,
    required this.items,
    this.height,
    this.crossAxisSpacing,
    this.paddignHorizontal,
  });

  final List<Widget> items;
  final double? height;
  final double? crossAxisSpacing;
  final double? paddignHorizontal;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:
          EdgeInsets.symmetric(vertical: 8, horizontal: paddignHorizontal ?? 0),
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: crossAxisSpacing ?? 5,
        mainAxisExtent: height ?? 310,
      ),
      itemBuilder: (context, indx) => items[indx],
    );
  }
}
