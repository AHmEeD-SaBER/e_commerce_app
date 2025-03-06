import 'package:e_commerce_app/data/repos/authentication/user/user_repo.dart';
import 'package:e_commerce_app/features/authentication/models/user.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepo());

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
}
