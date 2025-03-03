import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final RxInt currentCarousalIndex = 0.obs;

  void onCarousalChange(int index) {
    currentCarousalIndex.value = index;
  }
}
