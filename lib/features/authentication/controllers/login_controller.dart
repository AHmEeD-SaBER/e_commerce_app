import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final userController = Get.put(UserController());
  final deviceStorage = GetStorage();

  final hidePass = true.obs;
  final rememberMe = false.obs;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (deviceStorage.read('rme_email') != null) {
      email.text = deviceStorage.read('rme_email');
      password.text = deviceStorage.read('rme_password');
      rememberMe.value = true;
    }
  }

  Future<void> login() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Logging you in ...', 'assets/images/loading.json');

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
      if (rememberMe.value) {
        deviceStorage.write('rme_email', email.text.trim());
        deviceStorage.write('rme_password', password.text.trim());
      }

      // Sign in user
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (userCredential.user == null) {
        throw 'Failed to sign in';
      }

      // // Save user data
      // deviceStorage.write('user', userCredential.user!.uid);

      // Stop loading
      FullScreenLoader.stopLoadingDialog();

      AuthRepo.instance.screenRedirect();
    } catch (e) {
      // Stop loading
      FullScreenLoader.stopLoadingDialog();

      // Show error message
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }

  Future<void> singInWithGoogle() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Logging you in ...', 'assets/images/loading.json');

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      // Sign in user
      final userCredential = await AuthRepo.instance.loginWithGoogle();

      if (userCredential.user == null) {
        throw 'Failed to sign in';
      }

      await userController.saveUser(userCredential);

      FullScreenLoader.stopLoadingDialog();

      AuthRepo.instance.screenRedirect();
    } catch (e) {
      // Stop loading
      FullScreenLoader.stopLoadingDialog();

      // Show error message
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}
