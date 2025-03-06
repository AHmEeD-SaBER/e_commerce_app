import 'dart:math';

import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/data/repos/authentication/user/user_repo.dart';
import 'package:e_commerce_app/features/authentication/models/user.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/login/re_auth_login_form.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepo());
  final user = UserModel.empty().obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final userLoading = false.obs;
  final hidePass = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onReady() {
    fetchUserData();
  }

  Future<void> saveUser(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');

        final userName =
            UserModel.generatedUsername(userCredential.user!.displayName ?? '');

        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
        );

        await userRepo.saveUser(user);
      }
    } catch (e) {
      Loader.errorSnackbar(message: e.toString(), title: 'Error');
    }
  }

  Future<void> updateUser(UserModel updatedUser) async {
    try {
      userLoading.value = true;
      user.value = updatedUser;
      userLoading.value = false;
      await userRepo.updateUser(updatedUser);
    } catch (e) {
      Loader.errorSnackbar(message: e.toString(), title: 'Error');
      userLoading.value = false;
    }
  }

  Future<void> fetchUserData() async {
    try {
      userLoading.value = true;
      user.value = await userRepo.fetchUserData();
      userLoading.value = false;
    } catch (e) {
      Loader.errorSnackbar(message: e.toString(), title: 'Error');
      userLoading.value = false;
      rethrow;
    }
  }

  Future<void> updateField(Map<String, dynamic> data) async {
    try {
      userLoading.value = true;
      user.update((val) {
        val!.toJson().addAll(data);
      });
      await userRepo.updateField(data);
      userLoading.value = false;
    } catch (e) {
      Loader.errorSnackbar(message: e.toString(), title: 'Error');
      userLoading.value = false;
    }
  }

  void deletePopupWarning() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account?',
      confirm: ElevatedButton(
          onPressed: () async => deleteUser(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide.none),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          )),
      cancel:
          OutlinedButton(onPressed: () => Get.back(), child: Text('Cancel')),
    );
  }

  Future<void> deleteUser() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing', 'assets/images/processing.json');

      final auth = AuthRepo.instance;
      final provider = auth.user!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.loginWithGoogle();
          await auth.deleteUser();
          FullScreenLoader.stopLoadingDialog();

          Get.offAll(() => LoginScreen());
        } else {
          FullScreenLoader.stopLoadingDialog();
          Get.to(() => ReAuthLoginForm(), preventDuplicates: false);
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      Loader.errorSnackbar(message: e.toString(), title: 'Error');
    } finally {
      FullScreenLoader.stopLoadingDialog();
    }
  }

  Future<void> reAuthenticate() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processeing', 'assets/images/processing.json');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      await AuthRepo.instance.reAuthenticate(email.text, password.text);
      await AuthRepo.instance.deleteUser();
      FullScreenLoader.stopLoadingDialog();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Loader.errorSnackbar(message: e.toString(), title: 'Error');
    }
  }
}
