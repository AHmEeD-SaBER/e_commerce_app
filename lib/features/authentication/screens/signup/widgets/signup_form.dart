import 'package:e_commerce_app/features/authentication/controllers/signup_controller.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.formKey,
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
                  validator: (value) =>
                      Validator.validateEmptyField('FirstName', value),
                  controller: controller.firstName,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Last Name',
                  ),
                  validator: (value) =>
                      Validator.validateEmptyField('LastName', value),
                  controller: controller.lastName,
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
            validator: (value) =>
                Validator.validateEmptyField('UserName', value),
            controller: controller.userName,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sms),
              labelText: 'Email',
            ),
            validator: (value) => Validator.validateEmail(value),
            controller: controller.email,
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: 'Phone Number',
            ),
            keyboardType: TextInputType.phone,
            validator: (value) => Validator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
          ),
          SizedBox(height: 15),
          Obx(
            () => TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePass.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () {
                    controller.hidePass.value = !controller.hidePass.value;
                  },
                ),
                labelText: 'Password',
              ),
              obscureText: controller.hidePass.value,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              validator: (value) => Validator.validatePassword(value),
              controller: controller.password,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
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
              Obx(() => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (val) {
                    controller.privacyPolicy.value = val!;
                  })),
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
