import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:get/get.dart';

final List<Brand> brands = [
  Brand(
      id: 'nike',
      name: 'Nike',
      icon: 'assets/icons/brands/nike.png',
      isVerified: true,
      isFeatured: true,
      noProducts: 45,
      categoryId: ['7', '9'] // Shoes, Running Shoes
      ),
  Brand(
      id: 'adidas',
      name: 'Adidas',
      icon: 'assets/icons/brands/adidas.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 56,
      categoryId: ['6', '7', '9'] // Sports, Shoes, Running Shoes
      ),
  Brand(
      id: 'acer',
      name: 'Acer',
      icon: 'assets/icons/brands/acer.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 8,
      categoryId: ['1', '19'] // Electronics, Laptops
      ),
  Brand(
      id: 'apple',
      name: 'Apple',
      icon: 'assets/icons/brands/apple.png',
      isVerified: true,
      isFeatured: true,
      noProducts: 102,
      categoryId: ['1', '18', '19'] // Electronics, Mobiles, Laptops
      ),
  Brand(
      id: 'herman-miller',
      name: 'Herman Miller',
      icon: 'assets/icons/brands/herman-miller.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 34,
      categoryId: [
        '3',
        '15',
        '16',
        '17'
      ] // Furniture, Bedroom, Living Room, Kitchen
      ),
  Brand(
      id: 'ikea',
      name: 'IKEA',
      icon: 'assets/icons/brands/ikea.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 67,
      categoryId: [
        '3',
        '15',
        '16',
        '17'
      ] // Furniture, Bedroom, Living Room, Kitchen
      ),
  Brand(
      id: 'jordan',
      name: 'Jordan',
      icon: 'assets/icons/brands/jordan.png',
      isVerified: true,
      isFeatured: true,
      noProducts: 8,
      categoryId: ['6', '7', '9'] // Sports, Shoes, Running Shoes
      ),
  Brand(
      id: 'kenwood',
      name: 'Kenwood',
      icon: 'assets/icons/brands/kenwood.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 10,
      categoryId: ['1', '17'] // Electronics, Kitchen
      ),
  Brand(
      id: 'puma',
      name: 'Puma',
      icon: 'assets/icons/brands/puma.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 9,
      categoryId: ['6', '7', '9'] // Sports, Shoes, Running Shoes
      ),
  Brand(
      id: 'zara',
      name: 'Zara',
      icon: 'assets/icons/brands/zara.png',
      isVerified: true,
      isFeatured: true,
      noProducts: 5,
      categoryId: [
        '2',
        '10',
        '11',
        '12',
        '13',
        '14'
      ] // Fashion, Casual Shoes, Formal Shoes, T-Shirts, Shirts, Jeans
      ),
  Brand(
      id: 'samsung',
      name: 'Samsung',
      icon: 'assets/icons/brands/samsung.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 3,
      categoryId: ['1', '18', '19'] // Electronics, Mobiles, Laptops
      ),
  // Adding more brands to cover remaining categories
  Brand(
      id: 'loreal',
      name: 'L\'Oreal',
      icon: 'assets/icons/brands/loreal.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 25,
      categoryId: ['5'] // Cosmetics
      ),
  Brand(
      id: 'petcare',
      name: 'PetCare',
      icon: 'assets/icons/brands/petcare.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 15,
      categoryId: ['8'] // Animals
      ),
  Brand(
      id: 'jansport',
      name: 'JanSport',
      icon: 'assets/icons/brands/jansport.png',
      isVerified: true,
      isFeatured: false,
      noProducts: 20,
      categoryId: ['4'] // Backpack
      ),
];

class BrandsRepo extends GetxController {
  static BrandsRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<Brand>> fetchAllBrands() async {
    try {
      final result = await _db.collection('brands').get();
      return result.docs.map((doc) => Brand.fromJson(doc)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Brand> fetchBrandById(String brandId) async {
    try {
      final result = await _db.collection('brands').doc(brandId).get();
      return Brand.fromJson(result);
    } catch (e) {
      return Brand.empty();
    }
  }

  Future<void> uploadBrand(Brand brand) async {
    try {
      await _db.collection('brands').doc(brand.id).set(brand.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // void onInit() async {
  //   super.onInit();
  //   for (final brand in brands) {
  //     await _db.collection('brands').doc(brand.id).set(brand.toJson());
  //   }
  // }
}
