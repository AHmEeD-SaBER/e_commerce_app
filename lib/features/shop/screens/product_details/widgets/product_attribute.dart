import 'package:e_commerce_app/common/widgets/custom_choice_chip.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/attribute_sellector.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AttributeSellector());

    // Initialize the controller with the product variations
    controller.setVariations(product.variations);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.attributes.entries.map((attribute) {
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

                  // Check if this attribute value is available
                  final isAvailable = controller.isAttributeValueAvailable(
                      attribute.key, value.toString());

                  return CustomChoiceChip(
                    label: value.toString(),
                    selected: isSelected,
                    onTap: isAvailable
                        ? (selected) {
                            if (selected) {
                              controller.updateAttribute(
                                  attribute.key, value.toString());
                            }
                          }
                        : null, // Disable onTap when not available
                    isEnabled:
                        isAvailable, // Pass availability to CustomChoiceChip
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
