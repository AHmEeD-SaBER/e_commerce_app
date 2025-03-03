import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/common/widgets/slidable_list.dart';
import 'package:e_commerce_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (_, indx) => SlidableList(
                image: 'assets/icons/categories/backpack.png',
                title: 'Toys',
                onTap: () {
                  Get.to(() => SubCategoriesScreen());
                },
                backgroundColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
