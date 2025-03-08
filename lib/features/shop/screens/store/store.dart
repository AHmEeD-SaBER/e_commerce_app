import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/appbar/tabBar.dart';
import 'package:e_commerce_app/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/common/widgets/search_container.dart';
import 'package:e_commerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_brands.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/brand_card.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/tab_page.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    if (controller.categories.isEmpty) controller.fetchAllCategories();
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        appBar: CustomAppbar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              backgroundColor: const Color.fromARGB(197, 0, 221, 181),
              textColor: CustomColors.black,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsCrolled) {
            return [
              SliverAppBar(
                pinned: T,
                floating: T,
                backgroundColor: DeviceUtility.isDarkMood(context)
                    ? Colors.black
                    : Colors.white,
                expandedHeight: 440,
                collapsedHeight: 10,
                toolbarHeight: 10,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      SearchContainer(
                        text: 'Search in Store',
                        blacBackGround: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {
                          Get.to(() => AllBrands(
                                items: [
                                  BrandCard(
                                    name: 'Nike',
                                    maxWeight: 0.3,
                                    noProducts: '245',
                                    isVerified: T,
                                    brandImage: 'assets/icons/brands/nike.png',
                                  ),
                                ],
                                title: 'Brands',
                                gridHight: 80,
                                gridSpacing: 10,
                              ));
                        },
                        buttonTitle: 'View All',
                        showActionBtn: T,
                        blacBackGround: true,
                        paddingLeft: 10,
                        paddingRigth: 10,
                      ),
                      GridLayOut(
                        items: [
                          BrandCard(
                            name: 'Nike',
                            maxWeight: 50,
                            noProducts: '245',
                            isVerified: T,
                            brandImage: 'assets/icons/brands/nike.png',
                          ),
                          BrandCard(
                            name: 'Adidas',
                            maxWeight: 50,
                            noProducts: '367',
                            isVerified: T,
                            brandImage: 'assets/icons/brands/adidas-logo.png',
                          ),
                          BrandCard(
                            name: 'Zara',
                            noProducts: '32',
                            maxWeight: 50,
                            isVerified: T,
                            brandImage: 'assets/icons/brands/zara-logo.png',
                          ),
                          BrandCard(
                            name: 'Ikea',
                            noProducts: '120',
                            maxWeight: 50,
                            isVerified: T,
                            brandImage: 'assets/icons/brands/ikea_logo.png',
                          ),
                        ],
                        height: 80,
                        crossAxisSpacing: 10,
                      )
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: controller.categories
                      .map((e) => Tab(text: e.name))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
              children: controller.categories
                  .map((e) => TabPage(
                        category: e,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
