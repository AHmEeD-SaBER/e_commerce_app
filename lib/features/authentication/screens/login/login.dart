import 'package:e_commerce_app/features/authentication/screens/login/widgets/dividers.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/login_intro_section.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/sign_in_options.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: DeviceUtility.getAppBarHeight() - 10,
            left: 20,
            right: 20,
            bottom: DeviceUtility.getBottomNavigationBarHeight(context) + 10),
        child: Column(
          children: [
            LoginIntroSection(),
            SizedBox(height: 20),
            LoginForm(),
            SizedBox(height: 10),
            Dividers(text: 'Or Sign in with'),
            SizedBox(height: 20),
            SignInOptions(),
          ],
        ),
      ),
    ));
  }
}
