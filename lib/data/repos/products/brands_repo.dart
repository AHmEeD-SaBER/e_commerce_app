import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> brands = [
  {
    'id': 'nike',
    'name': 'Nike',
    'icon': 'assets/icons/brands/nike.png',
    'isVerified': true,
    'noProducts': 45
  },
  {
    'id': 'adidas',
    'name': 'Adidas',
    'icon': 'assets/icons/brands/adidas.png',
    'isVerified': true,
    'noProducts': 56
  },
  {
    'id': 'acer',
    'name': 'Acer',
    'icon': 'assets/icons/brands/acer.png',
    'isVerified': true,
    'noProducts': 8
  },
  {
    'id': 'apple',
    'name': 'Apple',
    'icon': 'assets/icons/brands/apple.png',
    'isVerified': true,
    'noProducts': 102
  },
  {
    'id': 'herman-miller',
    'name': 'Herman Miller',
    'icon': 'assets/icons/brands/herman-miller.png',
    'isVerified': true,
    'noProducts': 34
  },
  {
    'id': 'ikea',
    'name': 'IKEA',
    'icon': 'assets/icons/brands/ikea.png',
    'isVerified': true,
    'noProducts': 67
  },
  {
    'id': 'jordan',
    'name': 'Jordan',
    'icon': 'assets/icons/brands/jordan.png',
    'isVerified': true,
    'noProducts': 8
  },
  {
    'id': 'kenwood',
    'name': 'Kenwood',
    'icon': 'assets/icons/brands/kenwood.png',
    'isVerified': true,
    'noProducts': 10
  },
  {
    'id': 'puma',
    'name': 'Puma',
    'icon': 'assets/icons/brands/puma.png',
    'isVerified': true,
    'noProducts': 9
  },
  {
    'id': 'zara',
    'name': 'Zara',
    'icon': 'assets/icons/brands/zara.png',
    'isVerified': true,
    'noProducts': 5
  },
  {
    'id': 'samsung',
    'name': 'Samsung',
    'icon': 'assets/icons/brands/samsung.png',
    'isVerified': true,
    'noProducts': 3
  },
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

  @override
  void onInit() async {
    super.onInit();
    for (final brand in brands) {
      await _db.collection('brands').doc(brand['id']).set(brand);
    }
  }
}
