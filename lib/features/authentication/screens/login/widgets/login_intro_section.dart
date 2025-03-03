import 'package:flutter/material.dart';

class LoginIntroSection extends StatelessWidget {
  const LoginIntroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? 'assets/logos/dark_logo.png'
              : 'assets/logos/light_logo.png',
          scale: 10,
          height: 150,
        ),
        Text(
          'Welcome back,',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 10),
        Text(
          'Discover Limitless Choices and Unmatched Convenience',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
