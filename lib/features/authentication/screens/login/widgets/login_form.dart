import 'package:e_commerce_app/features/authentication/controllers/login_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (val) => Validator.validateEmail(val),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sms),
              labelText: 'E-mail',
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePass.value,
              validator: (val) => Validator.validatePassword(val),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.lock),
                suffixIcon: IconButton(
                    icon: Icon(controller.hidePass.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                    onPressed: () {
                      controller.hidePass.value = !controller.hidePass.value;
                    }),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (val) {
                        controller.rememberMe.value = val!;
                      },
                    ),
                  ),
                  Text('Remember me',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.white
                              : Colors.black)),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => ForgetPasswordScreen(
                        email: 'Email',
                      ));
                },
                child: Text('Forgot Password?',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? CustomColors.primaryColor
                            : CustomColors.darkerGrey)),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.login();
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (cntx) => SignupScreen()));
              },
              child: Text(
                'Sign Up',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
