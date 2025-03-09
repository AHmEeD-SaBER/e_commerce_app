import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/common/widgets/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/products_controller.dart';
import 'package:e_commerce_app/features/shop/models/category.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/brand_show_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabPage extends StatelessWidget {
  const TabPage({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final brandsController = Get.put(BrandController());
    final categoriesController = Get.put(CategoriesController());
    if (brandsController.brands.isEmpty) brandsController.fetchAllBrands();
    final productsController = Get.put(ProductsController());

    final brands = brandsController.brands
        .where((e) => e.categoryId.contains(category.id))
        .toList()
        .take(2)
        .toList();

    List<Map<int, List<Product>>> products = [];
    if (brands.isNotEmpty) {
      products.add({
        0: productsController.products
            .where((e) => e.brandId == brands[0].id)
            .toList()
            .take(3)
            .toList()
      });
      if (brands.length > 1) {
        products.add({
          1: productsController.products
              .where((e) => e.brandId == brands[1].id)
              .toList()
              .take(3)
              .toList()
        });
      }
    }

    productsController.fetchAllProducts();
    if (categoriesController.categories.isEmpty) {
      categoriesController.fetchAllCategories();
    }

    final subCategoriesIds = categoriesController.categories
        .where((e) => e.parentId == category.id)
        .map((e) => e.id)
        .toList();
    subCategoriesIds.add(category.id);

    List<Product> allProducts = [];
    for (final subCategoryId in subCategoriesIds) {
      print('subCategoryId: ' + subCategoryId);
      allProducts.addAll(productsController.products
          .where((e) => e.categoryId == subCategoryId)
          .toList());
    }

    print('allProducts count: ' + allProducts.length.toString());

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              if (brands.isNotEmpty)
                for (int i = 0; i < brands.length; i++)
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: BrandShowCase(
                      brand: brands[i],
                      onPressed: () {},
                      products: products[i][i]!,
                    ),
                  ),
              SectionHeading(
                title: 'You Might Like',
                buttonTitle: 'View All',
                blacBackGround: true,
                showActionBtn: true,
              ),
              SizedBox(
                height: 20,
              ),
              GridLayOut(
                  items: allProducts
                      .map((e) => ProductCardVertical(
                            product: e,
                            isFav: productsController.isProductFavorite(e.id),
                          ))
                      .toList())
            ],
          ),
        ),
      ],
    );
  }
}
