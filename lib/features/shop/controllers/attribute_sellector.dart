import 'package:e_commerce_app/data/repos/products/cart_repo.dart';
import 'package:e_commerce_app/data/repos/products/products_repo.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

class AttributeSellector extends GetxController {
  static AttributeSellector get to => Get.find();

  final selectedAttributes = <String, String>{}.obs;
  final variations = <Map<String, dynamic>>[].obs;
  final quantity = 1.obs;
  final selectedVariation = Rxn<Map<String, dynamic>>();
  final RxBool isAddingToCart = false.obs;

  // Current product ID
  String? currentProductId;

  // Add product repo
  final _productsRepo = Get.put(ProductsRepo());

  void setVariations(List<Map<String, dynamic>> productVariations) {
    variations.value = productVariations;

    // Clear any previous selections when setting new variations
    selectedAttributes.clear();
    selectedVariation.value = null;
    isAvailable.value = false;

    // Check if any variations have zero quantity and update UI
    refreshAttributeAvailability();
  }

  // Set the current product ID
  void setCurrentProductId(String productId) {
    currentProductId = productId;
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
  Future<void> addToCart() async {
    if (!isAvailable.value ||
        selectedVariation.value == null ||
        currentProductId == null) return;

    isAddingToCart.value = true;

    try {
      // Get the current variation
      final currentVariation =
          Map<String, dynamic>.from(selectedVariation.value!);

      // Create a copy of the variation with updated quantity
      final updatedVariation = Map<String, dynamic>.from(currentVariation);
      final currentQuantity = updatedVariation['Quantity'] as int;
      updatedVariation['Quantity'] = currentQuantity - quantity.value;

      // Update the stock in Firebase
      await _productsRepo.updateAmmountInStock(
          currentProductId!, currentVariation, updatedVariation);

      // Update local variation
      final index = variations.indexWhere(
          (variation) => _areVariationsEqual(variation, currentVariation));

      if (index != -1) {
        variations[index] = updatedVariation;
        // Update the selected variation
        if (_areVariationsEqual(selectedVariation.value!, currentVariation)) {
          selectedVariation.value = updatedVariation;
        }
      }

      // Refresh availability of all attributes
      refreshAttributeAvailability();

      // Reset quantity after adding to cart
      quantity.value = 1;

      // Show success message
      Loader.successSnackBar(
          title: 'Success', message: 'Added to cart successfully!');
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'Failed to add to cart: ${e.toString()}');
    } finally {
      isAddingToCart.value = false;
    }
  }

  // Refresh the availability of all attributes based on current variations
  void refreshAttributeAvailability() {
    // Force UI update for all attributes
    final currentAttributes = Map<String, String>.from(selectedAttributes);

    // Temporarily clear selections to force refresh
    selectedAttributes.clear();

    // Check if the current selection is still valid
    bool allAttributesStillValid = true;

    // Restore valid selections
    for (var entry in currentAttributes.entries) {
      if (isAttributeValueAvailable(entry.key, entry.value)) {
        selectedAttributes[entry.key] = entry.value;
      } else {
        allAttributesStillValid = false;
      }
    }

    // If any attribute is no longer valid, we need to check overall availability again
    if (!allAttributesStillValid) {
      checkOverallAvailability(quantity.value);
    }
  }

  // Helper method to compare variations
  bool _areVariationsEqual(
      Map<String, dynamic> var1, Map<String, dynamic> var2) {
    if (var1.length != var2.length) return false;

    for (final key in var1.keys) {
      if (key == 'Quantity') continue; // Skip quantity check
      if (var1[key] != var2[key]) return false;
    }

    return true;
  }

  // Check if a specific attribute value is available in any variation
  bool isAttributeValueAvailable(String attributeName, String value) {
    // If variations are empty, consider everything as available
    if (variations.isEmpty) return true;

    // Check if any variation with this attribute value has a quantity > 0
    for (var variation in variations) {
      if (variation[attributeName] == value && variation['Quantity'] > 0) {
        // For this attribute value, we need to check if it's compatible with other selected attributes
        bool isCompatibleWithSelection = true;

        // Check compatibility with other selected attributes
        for (var entry in selectedAttributes.entries) {
          // Skip the current attribute we're checking
          if (entry.key == attributeName) continue;

          // If this variation doesn't have the selected attribute value, it's not compatible
          if (variation[entry.key] != entry.value) {
            isCompatibleWithSelection = false;
            break;
          }
        }

        // If this variation is compatible with current selections and has quantity > 0, it's available
        if (isCompatibleWithSelection) {
          return true;
        }
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

    // Check if any variation matches all selected attributes
    bool foundMatch = false;

    for (var variation in variations) {
      bool matches = selectedAttributes.entries.every((entry) =>
          variation.containsKey(entry.key) &&
          variation[entry.key] == entry.value);

      if (matches) {
        foundMatch = true;
        selectedVariation.value = variation;
        final variationQuantity = variation['Quantity'] as int? ?? 0;

        if (variationQuantity >= quantity && variationQuantity > 0) {
          print('Available: $variationQuantity in stock');
          isAvailable.value = true;
          return;
        } else {
          print('Not enough stock: only $variationQuantity available');
          isAvailable.value = false;
          // Continue checking other variations in case there's another match with sufficient quantity
        }
      }
    }

    if (!foundMatch) {
      print('No matching variation found');
    } else {
      print('No matching variation with sufficient quantity');
    }

    isAvailable.value = false;
    if (!foundMatch) {
      selectedVariation.value = null;
    }
  }
}
