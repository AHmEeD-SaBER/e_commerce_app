import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/category.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

final subCategories = [
  Category(
      id: '9',
      name: 'Running Shoes',
      isFeatured: false,
      parentId: '7',
      image: 'assets/images/sales/sale4'),
  Category(
      id: '10',
      name: 'Casual Shoes',
      isFeatured: false,
      parentId: '7',
      image: 'assets/images/sales/sale5'),
  Category(
      id: '11',
      name: 'Formal Shoes',
      isFeatured: false,
      parentId: '7',
      image: 'assets/images/sales/sale6'),
  Category(
      id: '12',
      name: 'T-Shirts',
      isFeatured: false,
      parentId: '2',
      image: 'assets/images/sales/sale1'),
  Category(
      id: '13',
      name: 'Shirts',
      isFeatured: false,
      parentId: '2',
      image: 'assets/images/sales/sale2'),
  Category(
      id: '14',
      name: 'Jeans',
      isFeatured: false,
      parentId: '2',
      image: 'assets/images/sales/sale3'),
  Category(
      id: '15',
      name: 'Bedroom',
      isFeatured: false,
      parentId: '3',
      image: 'assets/images/sales/sale7'),
  Category(
      id: '16',
      name: 'Living Room',
      isFeatured: false,
      parentId: '3',
      image: 'assets/images/sales/sale8'),
  Category(
      id: '17',
      name: 'Kitchen',
      isFeatured: false,
      parentId: '3',
      image: 'assets/images/sales/sale9'),
  Category(
      id: '18',
      name: 'Mobiles',
      isFeatured: false,
      parentId: '1',
      image: 'assets/images/sales/sale1'),
  Category(
      id: '19',
      name: 'Laptops',
      isFeatured: false,
      parentId: '1',
      image: 'assets/images/sales/sale1'),
];

class CatRepo extends GetxController {
  static CatRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<Category>> fetchFeaturedCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      return snapshot.docs
          .map((doc) => Category.fromJson(doc))
          .where((cat) => cat.isFeatured)
          .toList();
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: e.message ?? 'An error occurred');
      rethrow;
    }
  }

  Future<List<Category>> fetchSubCategories(String catParentId) async {
    try {
      final snapshot = await _db.collection('categories').get();
      return snapshot.docs
          .map((doc) => Category.fromJson(doc))
          .where((cat) => cat.parentId == catParentId)
          .toList();
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: e.message ?? 'An error occurred');
      rethrow;
    }
  }

  Future<List<Category>> fetchMainCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      return snapshot.docs
          .map((doc) => Category.fromJson(doc))
          .where((cat) => cat.parentId.isEmpty)
          .toList();
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: e.message ?? 'An error occurred');
      rethrow;
    }
  }

  Future<void> uploadCategory(Category category) async {
    try {
      await _db
          .collection('categories')
          .doc(category.id)
          .set(category.toJson());
    } on FirebaseException catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: e.message ?? 'An error occurred');
      rethrow;
    }
  }
}
