import 'package:e_commerce_app/features/authentication/controllers/forget_pass_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPassController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forget Password',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Don\'t Worry Sometimes People Can Forget Too, Enter Your E-mail And We Will Send You a Password Reset Link.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: controller.formKey,
                child: Column(children: [
                  TextFormField(
                    controller: controller.email,
                    validator: (email) => Validator.validateEmail(email),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.sms),
                      labelText: 'E-mail',
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.forgetPassword();
                      },
                      child: Text(
                        'Submit',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
