import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  static ForgetPassController get isntance => Get.find();

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future forgetPassword() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing your request ...', 'assests/images/processing.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }
      AuthRepo.instance.resetPassword(email.text.trim());
      FullScreenLoader.stopLoadingDialog();
      Loader.successSnackBar(
          title: 'Success', message: 'Password reset link sent to your email');

      Get.to(LoginScreen());
    } on FirebaseAuthException catch (e) {
      FullScreenLoader.stopLoadingDialog();
      Loader.errorSnackbar(title: 'Error', message: e.message!);
    }
  }
}
