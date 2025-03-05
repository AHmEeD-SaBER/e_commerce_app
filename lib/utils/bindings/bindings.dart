import 'package:e_commerce_app/data/repos/authentication/auth_repo.dart';
import 'package:e_commerce_app/features/authentication/controllers/email_verifier.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());

    // Initialize your dependencies
    Get.put(AuthRepo(), permanent: true);
    // Add other dependencies as needed
  }
}
