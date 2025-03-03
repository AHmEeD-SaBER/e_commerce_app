import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
  });
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_cart,
            color: iconColor,
          ),
        ),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? const Color.fromARGB(219, 35, 35, 35),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                  child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: textColor ?? Colors.white),
              )),
            ))
      ],
    );
  }
}
