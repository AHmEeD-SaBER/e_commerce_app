import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:flutter/material.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({
    super.key,
    required this.items,
    required this.title,
    this.gridHight,
    this.gridSpacing,
  });
  final List<Widget> items;
  final String title;
  final double? gridHight;
  final double? gridSpacing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GridLayOut(
                items: items,
                height: gridHight,
                crossAxisSpacing: gridSpacing,
              )
            ],
          ),
        ),
      ),
    );
  }
}
