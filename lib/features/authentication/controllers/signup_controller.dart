import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/data/repos/authentication/user/user_repo.dart';
import 'package:e_commerce_app/features/authentication/models/user.dart';
import 'package:e_commerce_app/features/authentication/screens/signup_verfication/email_verification.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  final hidePass = true.obs;
  final privacyPolicy = false.obs;
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  void signup() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'We Are Validating Your Data Please Waite ...',
          'assets/images/processing.json');

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      // Validate form
      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      // Check privacy policy
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      // Create Firebase Auth user
      final userCredential = await AuthRepo.instance.signUpWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      if (userCredential.user == null) {
        throw 'Failed to create user account';
      }

      // Create user model
      final user = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        password: password.text.trim(),
      );

      final userRepo = Get.put(UserRepo());
      await userRepo.saveUser(user);
      // await userCredential.user!.sendEmailVerification();

      // Show success message and navigate
      Loader.successSnackBar(
          title: 'Success',
          message: 'Account created successfully! Please verify your email.');

      Get.to(() => EmaiVerificationScreen(
            image: 'assets/images/signup_verification.json',
            description: 'Please verify your email to continue',
            subtitle: email.text.trim(),
            btnTxt: 'Continue',
          ));
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
