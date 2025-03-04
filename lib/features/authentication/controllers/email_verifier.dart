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

  setTimerForAutoDirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.offAll(() => SucsessScreen(
              title: 'Your Email Has Been Verified',
              description:
                  'Congratulation You account Have been created succefuuly Happy Shopping !!',
              onPressed: () => AuthRepo.instance.screenRedirect(),
            ));
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
