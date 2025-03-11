import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/grid_lay_out.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllScreen extends StatelessWidget {
  const AllScreen(
      {super.key,
      required this.items,
      required this.showFilterBar,
      required this.title,
      this.gridHight,
      this.gridSpacing,
      this.showBrand = false});
  final List<Widget> items;
  final bool showFilterBar;
  final bool showBrand;
  final String title;
  final double? gridHight;
  final double? gridSpacing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (showBrand)
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       border: Border.all(color: Colors.grey),
                //       color: DeviceUtility.isDarkMood(context)
                //           ? CustomColors.black
                //           : CustomColors.grey),
                //   child: BrandCard(
                //       name: 'Nike',
                //       noProducts: '25',
                //       brandImage: 'assets/icons/brands/nike.png',
                //       onPressed: () {}),
                // ),
                SizedBox(
                  height: 20,
                ),
              if (showFilterBar)
                DropdownButtonFormField2(
                  items: [
                    'Name',
                    'Price',
                    'Brand',
                    'Category',
                    'Newest',
                    'Popular'
                  ]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {},
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.filter),
                    hintText: 'Filter By',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: double.infinity,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 300, // Set your desired width here
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: DeviceUtility.isDarkMood(context)
                          ? CustomColors.black
                          : CustomColors.grey,
                    ),
                    offset:
                        const Offset(0, -10), // Adjust the dropdown position
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: WidgetStateProperty.all(6),
                      thumbVisibility: WidgetStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              GridLayOut(
                items: items,
                height: gridHight,
                crossAxisSpacing: gridSpacing,
              )
            ],
          ),
        ),
      ),
    );
  }
}
