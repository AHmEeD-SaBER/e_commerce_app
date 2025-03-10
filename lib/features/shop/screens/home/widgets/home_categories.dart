import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/common/widgets/shimmer.dart';
import 'package:e_commerce_app/common/widgets/slidable_list.dart';
import 'package:e_commerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_commerce_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    if (controller.featuredCategories.isEmpty)
      controller.fetchFeaturedCategories();
    final categories = controller.featuredCategories;
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            title: 'Popular Categories',
            buttonTitle: 'View More',
            showActionBtn: false,
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          Obx(
            () => controller.isLoading.value
                ? CategoryShimmer(
                    itemCount: 12,
                  )
                : SizedBox(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (_, indx) => SlidableList(
                        image:
                            'assets/icons/categories/${categories[indx].image}.png',
                        title: categories[indx].name,
                        onTap: () {
                          Get.to(() => SubCategoriesScreen(
                                catParent: categories[indx],
                              ));
                        },
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => Container(
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    ShimmerEffect(
                      width: 55,
                      height: 55,
                      radius: 55,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ShimmerEffect(width: 55, height: 8)
                  ],
                ),
              ),
          itemCount: itemCount),
    );
  }
}
