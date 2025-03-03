import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.heigt,
    required this.width,
    required this.padding,
    required this.color,
    this.margin,
  });
  final double heigt;
  final double width;
  final double padding;
  final EdgeInsets? margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigt,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: color,
      ),
    );
  }
}
