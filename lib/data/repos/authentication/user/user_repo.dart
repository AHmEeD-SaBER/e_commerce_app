import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/authentication/models/user.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.message ?? 'Error');
      rethrow;
    }
  }
}
