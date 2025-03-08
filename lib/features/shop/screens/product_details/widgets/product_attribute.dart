import 'package:e_commerce_app/common/widgets/custom_choice_chip.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key, required this.attributes});
  final Map<String, List<dynamic>> attributes;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AttributeSellector());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.entries.map((attribute) {
        // Capitalize the first letter of attribute name
        final title =
            attribute.key[0].toUpperCase() + attribute.key.substring(1);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: title,
              showActionBtn: false,
              blacBackGround: true,
            ),
            const SizedBox(height: 10),
            Obx(
              () => Wrap(
                spacing: 10,
                children: attribute.value.map((value) {
                  final isSelected =
                      controller.getSelectedValue(attribute.key) ==
                          value.toString();
                  return CustomChoiceChip(
                    label: value.toString(),
                    selected: isSelected,
                    onTap: (selected) {
                      if (selected) {
                        controller.updateAttribute(
                            attribute.key, value.toString());
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }
}

class AttributeSellector extends GetxController {
  static AttributeSellector get to => Get.find();
  final selectedAttributes = <String, String>{}.obs;

  void updateAttribute(String attributeName, String value) {
    selectedAttributes[attributeName] = value;
  }

  String? getSelectedValue(String attributeName) {
    return selectedAttributes[attributeName];
  }
}
