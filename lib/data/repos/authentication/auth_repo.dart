import 'package:e_commerce_app/bottom_nav_bar.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup_verfication/email_verification.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String pass) async {
    try {
      // Print debug information
      print('Attempting to create user with email: $email');

      // Validate email and password before making the request
      if (email.isEmpty || !email.isEmail) {
        throw 'Please enter a valid email address';
      }

      if (pass.isEmpty || pass.length < 6) {
        throw 'Password must be at least 6 characters long';
      }

      // Create user
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: pass.trim(),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw 'This email address is already registered. Please use a different email.';
        case 'invalid-email':
          throw 'The email address is invalid. Please enter a valid email.';
        case 'operation-not-allowed':
          throw 'Email/Password accounts are not enabled. Please contact support.';
        case 'weak-password':
          throw 'The password provided is too weak. Please use a stronger password.';
        default:
          throw e.message ?? 'An unknown error occurred. Please try again.';
      }
    } catch (e) {
      throw 'An error occurred during signup. Please try again.';
    }
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => BottomNavBar());
      } else {
        Get.offAll(() => EmaiVerificationScreen(
              image: 'assets/images/signup_verification.json',
              description: 'Please verify your email to continue',
              subtitle: _auth.currentUser?.email,
              btnTxt: 'Continue',
            ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      if (deviceStorage.read('isFirstTime')) {
        Get.offAll(() => OnboardingScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
    }
  }
}
