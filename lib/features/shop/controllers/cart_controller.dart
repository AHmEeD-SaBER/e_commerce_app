import 'package:e_commerce_app/data/repos/products/cart_repo.dart';
import 'package:e_commerce_app/data/repos/products/products_repo.dart';
import 'package:e_commerce_app/features/shop/models/cart_item.dart';
import 'package:e_commerce_app/features/shop/models/product.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final _cartRepo = Get.put(CartRepo());
  final _productsRepo = Get.put(ProductsRepo());

  // Observable cart items
  final cartItems = <CartItem>[].obs;

  // Loading state
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  // Load cart items from storage
  Future<void> loadCartItems() async {
    isLoading.value = true;
    try {
      cartItems.value = _cartRepo.getCartItems();
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'Failed to load cart items');
    } finally {
      isLoading.value = false;
    }
  }

  // Add product to cart
  Future<void> addToCart({
    required Product product,
    required int quantity,
    required Map<String, String> selectedAttributes,
  }) async {
    isLoading.value = true;

    try {
      // Generate a unique ID for this cart item
      final itemId = CartItem.generateId(product.id, selectedAttributes);

      // Create cart item
      final cartItem = CartItem(
        id: itemId,
        productId: product.id,
        title: product.title,
        thumbnail: product.thumbnail,
        price: product.price,
        quantity: quantity,
        selectedAttributes: selectedAttributes,
        sale: product.sale,
        brandId: product.brandId,
      );

      // Add to storage
      await _cartRepo.addToCart(cartItem);

      // Reload cart items
      await loadCartItems();

      Loader.successSnackBar(title: 'Success', message: 'Item added to cart');
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'Failed to add item to cart');
    } finally {
      isLoading.value = false;
    }
  }

  // Remove item from cart
  Future<void> removeFromCart(String itemId) async {
    isLoading.value = true;

    try {
      await _cartRepo.removeFromCart(itemId);
      await loadCartItems();
      Loader.successSnackBar(
          title: 'Success', message: 'Item removed from cart');
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'Failed to remove item from cart');
    } finally {
      isLoading.value = false;
    }
  }

  // Update item quantity
  Future<void> updateItemQuantity(String itemId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(itemId);
      return;
    }

    try {
      await _cartRepo.updateItemQuantity(itemId, quantity);
      await loadCartItems();
    } catch (e) {
      Loader.errorSnackbar(
          title: 'Error', message: 'Failed to update item quantity');
    }
  }

  // Increment item quantity
  Future<void> incrementItemQuantity(String itemId) async {
    final item = cartItems.firstWhere((item) => item.id == itemId);
    await updateItemQuantity(itemId, item.quantity + 1);
  }

  // Decrement item quantity
  Future<void> decrementItemQuantity(String itemId) async {
    final item = cartItems.firstWhere((item) => item.id == itemId);
    if (item.quantity > 1) {
      await updateItemQuantity(itemId, item.quantity - 1);
    } else {
      await removeFromCart(itemId);
    }
  }

  // Clear cart
  Future<void> clearCart() async {
    isLoading.value = true;

    try {
      await _cartRepo.clearCart();
      await loadCartItems();
      Loader.successSnackBar(title: 'Success', message: 'Cart cleared');
    } catch (e) {
      Loader.errorSnackbar(title: 'Error', message: 'Failed to clear cart');
    } finally {
      isLoading.value = false;
    }
  }

  // Calculate total price
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  // Get total number of items in cart
  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
}
