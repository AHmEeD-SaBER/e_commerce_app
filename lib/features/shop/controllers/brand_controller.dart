import 'package:e_commerce_app/data/repos/products/brands_repo.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final repo = Get.put(BrandsRepo());
  final brands = <Brand>[].obs;
  final isLoading = false.obs;

  Future<void> fetchAllBrands() async {
    isLoading.value = true;
    brands.value = await repo.fetchAllBrands();
    isLoading.value = false;
  }

  Future<Brand> fetchBrandById(String brandId) async {
    isLoading.value = true;
    final brand = await repo.fetchBrandById(brandId);
    isLoading.value = false;
    return brand;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
