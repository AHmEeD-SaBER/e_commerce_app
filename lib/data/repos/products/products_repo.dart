import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

class ProductsRepo extends GetxController {
  static ProductsRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<Product>> fetchAllProducts() async {
    try {
      final result = await _db.collection('products').get();
      return result.docs.map((doc) => Product.fromJson(doc)).toList();
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    try {
      final result = await _db
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return result.docs.map((doc) => Product.fromJson(doc)).toList();
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<Product>> fetchProductsByBrand(String brandId) async {
    try {
      final result = await _db
          .collection('products')
          .where('brandId', isEqualTo: brandId)
          .get();
      return result.docs.map((doc) => Product.fromJson(doc)).toList();
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<Product> fetchProductById(String productId) async {
    try {
      final result = await _db.collection('products').doc(productId).get();
      return Product.fromJson(result);
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return Product.empty();
    }
  }

  Future<List<Product>> fetchFeaturedProducts() async {
    try {
      final result = await _db
          .collection('products')
          .where('isFeatured', isEqualTo: true)
          .get();
      return result.docs.map((doc) => Product.fromJson(doc)).toList();
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<String>> fetchFavoriteProducts(String userId) async {
    try {
      final result = await _db
          .collection('wishList')
          .where('userId', isEqualTo: userId)
          .get();

      // Extract the productId field from each document
      return result.docs.map((doc) => doc['productId'] as String).toList();
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<void> addToFavorite(String productId, String userId) async {
    try {
      // First check if the product is already in the wishlist
      final isAlreadyFavorite = await isProductInWishList(productId, userId);

      // Only add if it's not already a favorite
      if (!isAlreadyFavorite) {
        await _db.collection('wishList').add({
          'productId': productId,
          'userId': userId,
          'createdAt': DateTime.now(),
        });
      }
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }

  Future<void> removeFromFavorite(String productId, String userId) async {
    try {
      // Query to find the document with matching userId and productId
      await _db
          .collection('wishList')
          .where('userId', isEqualTo: userId)
          .where('productId', isEqualTo: productId)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
    }
  }

  Future<bool> isProductInWishList(String productId, String userId) async {
    try {
      final result = await _db
          .collection('wishList')
          .where('userId', isEqualTo: userId)
          .where('productId', isEqualTo: productId)
          .get();
      return result.docs.isNotEmpty;
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return false;
    }
  }
}
