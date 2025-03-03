import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/signup_verfication/email_verification.dart';
import 'package:e_commerce_app/common/widgets/sucsess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'First Name',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: 'Username',
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sms),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: 'Phone Number',
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: 'Password',
            ),
            obscuringCharacter: '*',
            obscureText: true,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => EmaiVerificationScreen(
                      image: 'assets/images/signup_verification.json',
                      description:
                          'Cngratulations! Your Account Awating for Verification: Verify Your Email Address to Start Shopping and Experience a Wrld of Unrivaled Deals and Discounts',
                      subtitle: 'email',
                      btnTxt: 'Continue',
                      onPressed: () {
                        Get.offAll(() => SucsessScreen(
                              title: 'Your Account Successfully Created!',
                              description:
                                  'Welcome to E-Commerce App. Your Account has been successfully created. Start Shopping and Experience a World of Unrivaled Deals and Discounts',
                              onPressed: () {
                                Get.offAll(() => LoginScreen());
                              },
                            ));
                      },
                    ));
              },
              child: Text('Create Account',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.black
                          : Colors.white)),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: true, onChanged: (val) {}),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'You agree to our ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                        text: 'Privacy Policy ',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: 'Terms of use',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
