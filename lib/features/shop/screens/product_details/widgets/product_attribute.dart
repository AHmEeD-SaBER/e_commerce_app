import 'package:e_commerce_app/common/widgets/custom_choice_chip.dart';
import 'package:e_commerce_app/common/widgets/section_heading.dart';
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

class AttributeSellector extends GetxController {
  static AttributeSellector get to => Get.find();
  final selectedAttributes = <String, String>{}.obs;
  final variations = <Map<String, dynamic>>[].obs;
  final quantity = 1.obs;
  final selectedVariation = Rxn<Map<String, dynamic>>();
  final RxBool isAddingToCart = false.obs;

  void setVariations(List<Map<String, dynamic>> productVariations) {
    variations.value = productVariations;
  }

  void updateAttribute(String attributeName, String value) {
    selectedAttributes[attributeName] = value;
    // After updating an attribute, check overall availability
    checkOverallAvailability(quantity.value);
  }

  String? getSelectedValue(String attributeName) {
    return selectedAttributes[attributeName];
  }

  // Increment the quantity and check availability
  void incrementQuantity() {
    quantity.value++;
    checkOverallAvailability(quantity.value);
  }

  // Decrement the quantity and check availability
  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      checkOverallAvailability(quantity.value);
    }
  }

  // Add to cart functionality
  void addToCart() {
    if (!isAvailable.value) return;

    isAddingToCart.value = true;

    // Simulate adding to cart (replace with actual implementation)
    Future.delayed(Duration(seconds: 1), () {
      // Reset quantity after adding to cart
      quantity.value = 1;
      isAddingToCart.value = false;

      // Show success message (implement as needed)
      print('Added to cart successfully!');
    });
  }

  // Check if a specific attribute value is available in any variation
  bool isAttributeValueAvailable(String attributeName, String value) {
    // If variations are empty, consider everything as available
    if (variations.isEmpty) return true;

    // Check if any variation with this attribute value has a quantity > 0
    for (var variation in variations) {
      if (variation[attributeName] == value && variation['Quantity'] > 0) {
        return true;
      }
    }

    return false;
  }

  // Get the maximum available quantity for the current selection
  int getMaxAvailableQuantity() {
    if (selectedVariation.value == null) return 0;
    return selectedVariation.value!['Quantity'] as int? ?? 0;
  }

  final isAvailable = false.obs;

  void checkOverallAvailability(int quantity) {
    // Get all attribute keys from the variations
    final allAttributeKeys = <String>{};
    for (var variation in variations) {
      for (var key in variation.keys) {
        if (key != 'Quantity') {
          allAttributeKeys.add(key);
        }
      }
    }

    // If we don't have all required attributes selected yet, don't check
    if (selectedAttributes.length < allAttributeKeys.length) {
      isAvailable.value = false;
      selectedVariation.value = null;
      return;
    }

    for (var variation in variations) {
      bool matches = selectedAttributes.entries.every((entry) =>
          variation.containsKey(entry.key) &&
          variation[entry.key] == entry.value);

      if (matches) {
        selectedVariation.value = variation;
        if (variation['Quantity'] >= quantity) {
          print('Available');
          isAvailable.value = true;
          return;
        } else {
          print('Not enough stock');
          isAvailable.value = false;
          return;
        }
      }
    }

    print('No matching variation found');
    isAvailable.value = false;
    selectedVariation.value = null;
  }
}
