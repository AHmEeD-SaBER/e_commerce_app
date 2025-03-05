import 'dart:async';
import 'package:e_commerce_app/common/widgets/sucsess.dart';
import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailVerifier extends GetxController {
  static EmailVerifier get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthRepo.instance.sendEmailVerification();
      Loader.successSnackBar(
          title: 'Success',
          message:
              'A verification email has been sent to your email address. Please verify your email to continue.');
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }

  void setTimerForAutoDirect() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      // Changed to 3 seconds
      try {
        // Get current user and reload
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.reload();
          // Get fresh user data after reload
          final freshUser = FirebaseAuth.instance.currentUser;

          if (freshUser?.emailVerified ?? false) {
            timer.cancel();
            Get.offAll(() => SucsessScreen(
                  title: 'Your Email Has Been Verified',
                  description:
                      'Congratulation You account Have been created successfully Happy Shopping !!',
                  onPressed: () => AuthRepo.instance.screenRedirect(),
                ));
          }
        }
      } catch (e) {
        timer.cancel();
        Loader.errorSnackbar(
            title: 'Error',
            message: 'Could not verify email status: ${e.toString()}');
      }
    });
  }

  checkEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.emailVerified ?? false) {
      Get.offAll(() => SucsessScreen(
            title: 'Your Email Has Been Verified',
            description:
                'Congratulation You account Have been created succefuuly Happy Shopping !!',
            onPressed: () => AuthRepo.instance.screenRedirect(),
          ));
    } else {
      setTimerForAutoDirect();
    }
  }
}
