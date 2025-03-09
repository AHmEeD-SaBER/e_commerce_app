import 'package:e_commerce_app/data/repos/products/products_repo.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();
  final repo = Get.put(ProductsRepo());
  final userController = UserController.instance;

  final products = <Product>[].obs;
  final isLoading = false.obs;
  final favoriteProducts = <String>[].obs;

  // Add a flag to track if favorites have been loaded
  final isFavoritesLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    // We'll load favorites when needed
  }

  // This method ensures favorites are loaded before checking favorite status
  Future<void> ensureFavoritesLoaded() async {
    if (!isFavoritesLoaded.value) {
      await fetchFavoriteProducts(userController.user.value.id);
    }
  }

  Future<void> fetchAllProducts() async {
    isLoading.value = true;
    products.value = await repo.fetchAllProducts();
    isLoading.value = false;
    // Ensure favorites are loaded after products
    await ensureFavoritesLoaded();
  }

  Future<void> fetchProductsByCategory(String categoryId) async {
    isLoading.value = true;
    products.value = await repo.fetchProductsByCategory(categoryId);
    isLoading.value = false;
    // Ensure favorites are loaded after products
    await ensureFavoritesLoaded();
  }

  Future<void> fetchProductsByBrand(String brandId) async {
    isLoading.value = true;
    products.value = await repo.fetchProductsByBrand(brandId);
    isLoading.value = false;
    // Ensure favorites are loaded after products
    await ensureFavoritesLoaded();
  }

  Future<void> fetchProductById(String productId) async {
    isLoading.value = true;
    products.value = [await repo.fetchProductById(productId)];
    isLoading.value = false;
    // Ensure favorites are loaded after products
    await ensureFavoritesLoaded();
  }

  Future<void> fetchFeaturedProducts() async {
    isLoading.value = true;
    try {
      products.value = await repo.fetchFeaturedProducts();
    } catch (e) {
      print("Error fetching featured products: $e");
    } finally {
      isLoading.value = false;
    }

    // Ensure favorites are loaded after products
    await ensureFavoritesLoaded();
  }

  Future<void> fetchFavoriteProducts(String userId) async {
    try {
      // Don't set isLoading here to avoid UI flicker
      // Clear existing favorites first to avoid duplicates
      favoriteProducts.clear();

      // Get updated favorites from database
      final favorites = await repo.fetchFavoriteProducts(userId);

      // Update the list
      favoriteProducts.addAll(favorites);
      print('Favorite products loaded: $favorites');

      // Mark favorites as loaded
      isFavoritesLoaded.value = true;
    } catch (e) {
      print("Error loading favorites: $e");
    }
  }

  Future<void> addToFavorite(String productId) async {
    if (!favoriteProducts.contains(productId)) {
      await repo.addToFavorite(productId, userController.user.value.id);
      favoriteProducts.add(productId);
      update(); // Force UI update
    }
  }

  Future<void> removeFromFavorite(String productId) async {
    if (favoriteProducts.contains(productId)) {
      await repo.removeFromFavorite(productId, userController.user.value.id);
      favoriteProducts.remove(productId);
      update(); // Force UI update
    }
  }

  bool isProductFavorite(String productId) {
    // Only check favorites if they've been loaded
    if (isFavoritesLoaded.value) {
      return favoriteProducts.contains(productId);
    }
    // Default to not favorite if favorites haven't loaded yet
    return false;
  }
}
