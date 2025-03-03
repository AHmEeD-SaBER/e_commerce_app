import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SaleContainer extends StatelessWidget {
  const SaleContainer({super.key, required this.amount, this.obacity = 180});
  final String amount;
  final int obacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(obacity, 0, 221, 181),
      ),
      child: Text(
        amount,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: CustomColors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
