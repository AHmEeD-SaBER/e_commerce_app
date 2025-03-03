import 'package:e_commerce_app/features/authentication/screens/login/widgets/dividers.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/sign_in_options.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.primaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: DeviceUtility.getBottomNavigationBarHeight(context) + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SignupIntroSection(),
              Text(
                'Let\'s Create Your Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 22),
              ),
              SizedBox(height: 20),
              // SignupForm(),
              SignupForm(),
              SizedBox(height: 15),
              Dividers(text: 'Or Sign up with'),
              SizedBox(height: 20),
              SignInOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
