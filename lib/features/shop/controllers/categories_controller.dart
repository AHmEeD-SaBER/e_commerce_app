import 'package:e_commerce_app/data/repos/category/cat_repo.dart';
import 'package:e_commerce_app/features/shop/models/category.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();
  final _repo = Get.put(CatRepo());

  RxList categories = <Category>[].obs;
  RxList featuredCategories = <Category>[].obs;
  final isLoading = false.obs;

  Future<void> fetchAllCategories() async {
    isLoading.value = true;

    categories.value = await _repo.fetchAllCategories();
    featuredCategories.value = categories
        .where((cat) => cat.isFeatured && cat.parentId.isEmpty)
        .toList();
    isLoading.value = false;
  }
}
