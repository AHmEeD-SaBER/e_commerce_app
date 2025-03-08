import 'package:e_commerce_app/data/repos/products/products_repo.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();
  final repo = Get.put(ProductsRepo());

  final products = <Product>[].obs;
  final isLoading = false.obs;

  Future<void> fetchAllProducts() async {
    isLoading.value = true;
    products.value = await repo.fetchAllProducts();
    isLoading.value = false;
  }

  Future<void> fetchProductsByCategory(String categoryId) async {
    isLoading.value = true;
    products.value = await repo.fetchProductsByCategory(categoryId);
    isLoading.value = false;
  }

  Future<void> fetchProductsByBrand(String brandId) async {
    isLoading.value = true;
    products.value = await repo.fetchProductsByBrand(brandId);
    isLoading.value = false;
  }

  Future<void> fetchProductById(String productId) async {
    isLoading.value = true;
    products.value = [await repo.fetchProductById(productId)];
    isLoading.value = false;
  }

  Future<void> fetchFeaturedProducts() async {
    isLoading.value = true;
    products.value = await repo.fetchFeaturedProducts();
    isLoading.value = false;
  }
}
