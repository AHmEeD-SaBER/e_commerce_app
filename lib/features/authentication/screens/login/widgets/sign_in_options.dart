import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/logos/google.png', scale: 10),
          ),
        ),
        SizedBox(width: 30),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/logos/facebook.png', scale: 10),
          ),
        ),
      ],
    );
  }
}
