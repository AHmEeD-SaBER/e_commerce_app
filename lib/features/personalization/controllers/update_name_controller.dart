import 'package:e_commerce_app/data/repos/user/user_repo.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  final userRepo = Get.put(UserRepo());
  final userController = UserController.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    intializeField();
    super.onInit();
  }

  intializeField() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateName() async {
    try {
      // First validate form
      if (!formKey.currentState!.validate()) {
        return;
      }

      // Show loading
      FullScreenLoader.openLoadingDialog('We are updating your information...',
          'assets/images/processing.json');

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      // Update the user data
      await userRepo.updateField({
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
      });

      // Update local user data
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Show success and close
      FullScreenLoader.stopLoadingDialog();
      Loader.successSnackBar(title: 'Success', message: 'Name updated');
      Get.off(() => Profile());
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }
}

class UpdateUserNameController extends GetxController {
  final userRepo = Get.put(UserRepo());
  final userController = UserController.instance;
  final userName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateUserName() async {
    if (formKey.currentState!.validate()) {
      await userRepo.updateField({
        'userName': userName.text,
      });
      Get.offAll(() => Profile());
    }
  }
}

class UpdatePhoneNumberController extends GetxController {
  final userRepo = Get.put(UserRepo());
  final userController = UserController.instance;
  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updatePhoneNumber() async {
    if (formKey.currentState!.validate()) {
      await userRepo.updateField({
        'phoneNumber': phoneNumber.text,
      });
      Get.back();
    }
  }
}
