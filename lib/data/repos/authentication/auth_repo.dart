import 'package:e_commerce_app/bottom_nav_bar.dart';
import 'package:e_commerce_app/data/repos/user/user_repo.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup_verfication/email_verification.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  User? get user => _auth.currentUser;

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

  Future<UserCredential> login(String email, String password) async {
    try {
      // Sign in with email and password
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Ensure we fetch fresh user data for the current user
      if (Get.isRegistered<UserController>()) {
        await Get.find<UserController>().fetchUserData();
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
      rethrow;
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // Sign in with Google credentials
      final userCredential = await _auth.signInWithCredential(credential);

      // Ensure we fetch fresh user data for the current user
      if (Get.isRegistered<UserController>()) {
        await Get.find<UserController>().fetchUserData();
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
      rethrow;
    }
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Ensure we fetch fresh user data for the current user
      if (Get.isRegistered<UserController>()) {
        await Get.find<UserController>().fetchUserData();
      }

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
      // Clear any existing user data
      if (Get.isRegistered<UserController>()) {
        Get.find<UserController>().clearUserData();
      }

      // Check if it's first time
      final isFirstTime = deviceStorage.read('isFirstTime') ?? true;

      if (isFirstTime) {
        // Set isFirstTime to false after showing onboarding
        deviceStorage.write('isFirstTime', false);
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
      // Clear any cached user data
      Get.find<UserController>().clearUserData();

      // Sign out from Firebase
      await GoogleSignIn()
          .signOut(); // Sign out from Google if signed in with Google
      await _auth.signOut();

      // Navigate to login screen
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: 'An error occurred during logout. Please try again.');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
    }
  }

  Future<void> reAuthenticate(String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
    }
  }

  Future<void> deleteUser() async {
    try {
      await UserRepo.instance.deleteUser();
      await _auth.currentUser?.delete();
      Loader.successSnackBar(
          title: 'Success', message: 'Account deleted successfully');
    } on FirebaseAuthException catch (e) {
      Loader.errorSnackbar(
          title: 'Error',
          message: e.message ?? 'An unknown error occurred. Please try again.');
    }
  }
}
