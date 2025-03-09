import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Verify That This Is You'),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.reAuthFormKey,
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
                            controller.hidePass.value =
                                !controller.hidePass.value;
                          }),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.reAuthenticate();
                    },
                    child: Text(
                      'Verify',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
