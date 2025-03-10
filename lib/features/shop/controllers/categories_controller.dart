import 'package:e_commerce_app/data/repos/category/cat_repo.dart';
import 'package:e_commerce_app/features/shop/models/category.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();
  final _repo = Get.put(CatRepo());

  RxList featuredCategories = <Category>[].obs;
  RxList subCategories = <Category>[].obs;
  RxList mainCategories = <Category>[].obs;
  final isLoading = false.obs;

  Future<void> fetchFeaturedCategories() async {
    isLoading.value = true;

    featuredCategories.value = await _repo.fetchFeaturedCategories();
    isLoading.value = false;
  }

  Future<void> fetchSubCategories(String catParentId) async {
    isLoading.value = true;
    subCategories.value = await _repo.fetchSubCategories(catParentId);
    isLoading.value = false;
  }

  Future<void> fetchMainCategories() async {
    isLoading.value = true;
    mainCategories.value = await _repo.fetchMainCategories();
    isLoading.value = false;
  }
}
