import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
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

  Future<UserModel> fetchUserData() async {
    try {
      final user =
          await _db.collection('users').doc(AuthRepo.instance.user?.uid).get();

      if (user.exists) {
        return UserModel.fromSnapshot(user);
      }
      return UserModel.empty();
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.message ?? 'Error');
      rethrow;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).update(user.toJson());
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.message ?? 'Error');
      rethrow;
    }
  }

  Future<void> updateField(Map<String, dynamic> data) async {
    try {
      await _db
          .collection('users')
          .doc(AuthRepo.instance.user?.uid)
          .update(data);
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.message ?? 'Error');
      rethrow;
    }
  }

  Future<void> deleteUser() async {
    try {
      await _db.collection('users').doc(AuthRepo.instance.user?.uid).delete();
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.message ?? 'Error');
      rethrow;
    }
  }

  Future<String> getUserName(String userId) async {
    try {
      final user = await _db.collection('users').doc(userId).get();
      return user.data()?['userName'] ?? '';
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.message ?? 'Error');
      rethrow;
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      rethrow;
    }
  }
}
