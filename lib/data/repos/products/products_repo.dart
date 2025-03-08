import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
// import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

// final List<Product> products = [
//   // Nike Shoes Collection
//   Product(
//     id: 'nike-air-jordan-black-red',
//     title: 'Nike Air Jordan Black Red',
//     description:
//         'Premium Nike Air Jordan sneakers featuring classic black and red colorway with superior comfort and style',
//     price: 199.99,
//     thumbnail: ImageStrings.productImage7,
//     images: [
//       ImageStrings.productImage7,
//       ImageStrings.productImage8,
//       ImageStrings.productImage9,
//       ImageStrings.productImage10
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Size': ['38', '39', '40', '41', '42', '43', '44'],
//       'Color': ['Black/Red', 'Orange', 'White/Magenta', 'White/Red']
//     },
//     categoryId: '7',
//     brandId: 'nike',
//     sale: 0.0,
//     stock: 50,
//     rating: 4.8,
//   ),

//   Product(
//     id: 'nike-air-max',
//     title: 'Nike Air Max',
//     description:
//         'Classic Nike Air Max featuring advanced cushioning technology',
//     price: 189.99,
//     thumbnail: ImageStrings.productImage21,
//     images: [ImageStrings.productImage21],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Size': ['38', '39', '40', '41', '42', '43', '44'],
//       'Color': ['Grey/White']
//     },
//     categoryId: '7',
//     brandId: 'nike',
//     sale: 0.0,
//     stock: 45,
//     rating: 4.6,
//   ),

//   // Mobile Phones
//   Product(
//     id: 'samsung-s9',
//     title: 'Samsung Galaxy S9',
//     description:
//         'Samsung Galaxy S9 with advanced camera features and stunning display',
//     price: 699.99,
//     thumbnail: ImageStrings.productImage11,
//     images: [
//       ImageStrings.productImage11,
//       ImageStrings.productImage12,
//       ImageStrings.productImage13
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Storage': ['64GB', '128GB'],
//       'Color': ['Black', 'Blue'],
//       'RAM': ['4GB', '6GB']
//     },
//     categoryId: '18',
//     brandId: 'samsung',
//     sale: 15.0,
//     stock: 30,
//     rating: 4.5,
//   ),

//   Product(
//     id: 'iphone-8',
//     title: 'iPhone 8',
//     description: 'Apple iPhone 8 with powerful performance and premium design',
//     price: 599.99,
//     thumbnail: ImageStrings.productImage14,
//     images: [
//       ImageStrings.productImage14,
//       ImageStrings.productImage15,
//       ImageStrings.productImage16,
//       ImageStrings.productImage17
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Storage': ['64GB', '256GB'],
//       'Color': ['Silver', 'Space Grey', 'Gold']
//     },
//     categoryId: '18',
//     brandId: 'apple',
//     sale: 0.0,
//     stock: 25,
//     rating: 4.6,
//   ),

//   // Tracksuits
//   Product(
//     id: 'premium-tracksuit-collection',
//     title: 'Premium Sports Tracksuit',
//     description: 'High-quality sports tracksuit available in multiple colors',
//     price: 89.99,
//     thumbnail: ImageStrings.productImage24,
//     images: [
//       ImageStrings.productImage24,
//       ImageStrings.productImage25,
//       ImageStrings.productImage26,
//       ImageStrings.productImage27
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Size': ['S', 'M', 'L', 'XL', 'XXL'],
//       'Color': ['Black', 'Blue', 'Red', 'Parrot Green']
//     },
//     categoryId: '2',
//     brandId: 'puma',
//     sale: 0.0,
//     stock: 60,
//     rating: 4.3,
//   ),

//   // Sports Equipment
//   Product(
//     id: 'sports-equipment-collection',
//     title: 'Professional Sports Equipment',
//     description: 'High-quality sports equipment for professional athletes',
//     price: 149.99,
//     thumbnail: ImageStrings.productImage28,
//     images: [
//       ImageStrings.productImage28,
//       ImageStrings.productImage29,
//       ImageStrings.productImage30,
//       ImageStrings.productImage31
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Type': ['Football', 'Baseball Bat', 'Cricket Bat', 'Tennis Racket']
//     },
//     categoryId: '6',
//     brandId: 'adidas',
//     sale: 10.0,
//     stock: 40,
//     rating: 4.7,
//   ),

//   // Bedroom Furniture
//   Product(
//     id: 'modern-bedroom-collection',
//     title: 'Modern Bedroom Set',
//     description: 'Complete modern bedroom furniture set',
//     price: 1299.99,
//     thumbnail: ImageStrings.productImage32,
//     images: [
//       ImageStrings.productImage32,
//       ImageStrings.productImage33,
//       ImageStrings.productImage34,
//       ImageStrings.productImage35
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Type': ['Bed', 'Lamp', 'Sofa', 'Wardrobe'],
//       'Color': ['Brown', 'Beige']
//     },
//     categoryId: '15',
//     brandId: 'ikea',
//     sale: 0.0,
//     stock: 15,
//     rating: 4.8,
//   ),

//   // Kitchen Furniture
//   Product(
//     id: 'kitchen-essentials-collection',
//     title: 'Kitchen Essentials Set',
//     description: 'Complete kitchen furniture and appliances set',
//     price: 2499.99,
//     thumbnail: ImageStrings.productImage36,
//     images: [
//       ImageStrings.productImage36,
//       ImageStrings.productImage37,
//       ImageStrings.productImage38
//     ],
//     isFavorite: false,
//     isFeatured: true,
//     attributes: {
//       'Type': ['Counter', 'Dining Table', 'Refrigerator'],
//       'Color': ['White', 'Silver']
//     },
//     categoryId: '17',
//     brandId: 'ikea',
//     sale: 10.0,
//     stock: 10,
//     rating: 4.6,
//   ),
// ];

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
      print(e);
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<Product>> fetchFavoriteProducts() async {
    try {
      final result = await _db
          .collection('products')
          .where('isFav', isEqualTo: true)
          .get();
      return result.docs.map((doc) => Product.fromJson(doc)).toList();
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: e.toString());
      return [];
    }
  }
}
