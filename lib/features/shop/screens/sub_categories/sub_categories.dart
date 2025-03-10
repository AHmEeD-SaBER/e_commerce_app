import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/curved_image_container.dart';
import 'package:e_commerce_app/common/widgets/product_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/products_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand.dart';
import 'package:e_commerce_app/features/shop/models/category.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.catParent});

  final Category catParent;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchSubCategories(catParent.id);
    });
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          catParent.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Obx(
            () => controller.isLoading.value
                ? CategoryShimmer(
                    itemCount: 12,
                  )
                : Column(
                    children: [
                      CurvedImageContainer(
                        width: double.infinity,
                        paddingHorizontal: 0,
                        imageUrl: 'assets/images/sales/sale1.jpeg',
                        isFill: true,
                      ),
                      SizedBox(height: 30),
                      ...controller.subCategories
                          .map(
                            (e) => ProductsSection(
                              title: e.name,
                              subCategoryId: e.id,
                            ),
                          )
                          .toList(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.subCategoryId,
    required this.title,
  });
  final String subCategoryId;
  final String title;
  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(ProductsController());
    productsController.fetchProductsByCategory(subCategoryId);
    final products = productsController.productsByCategory;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: title,
          showActionBtn: true,
          buttonTitle: 'view all',
          blacBackGround: true,
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: Obx(() {
            return ListView.separated(
              itemBuilder: (_, indx) => ProductCardHorizontal(
                product: products[indx],
              ),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 16),
            );
          }),
        )
      ],
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(179, 224, 224, 224),
      highlightColor: const Color.fromARGB(176, 245, 245, 245),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shimmer placeholder for banner
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 80),
          // Shimmer placeholders for category sections
          for (int i = 0; i < (itemCount ~/ 4); i++) ...[
            Container(
              width: 150,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 150,
              child: ListView.separated(
                itemBuilder: (_, index) => Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 16),
              ),
            ),
            SizedBox(height: 30),
          ]
        ],
      ),
    );
  }
}
