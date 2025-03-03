import 'package:e_commerce_app/common/widgets/curved_edges.dart';
import 'package:flutter/material.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
