import 'dart:convert';
import 'package:e_commerce_app/features/shop/models/cart_item.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartRepo extends GetxController {
  static CartRepo get instance => Get.find();

  final _storage = GetStorage();
  final _cartKey = 'cart_items';

  // Get all cart items
  List<CartItem> getCartItems() {
    final cartData = _storage.read<String>(_cartKey);
    if (cartData == null) return [];

    try {
      final List<dynamic> decodedData = json.decode(cartData);
      return decodedData.map((item) => CartItem.fromJson(item)).toList();
    } catch (e) {
      print('Error loading cart: $e');
      return [];
    }
  }

  // Save cart items
  Future<void> saveCartItems(List<CartItem> items) async {
    final encodedData =
        json.encode(items.map((item) => item.toJson()).toList());
    await _storage.write(_cartKey, encodedData);
  }

  // Add item to cart
  Future<void> addToCart(CartItem item) async {
    final cartItems = getCartItems();

    // Check if item with same ID already exists
    final existingIndex = cartItems.indexWhere((i) => i.id == item.id);

    if (existingIndex >= 0) {
      // Update existing item
      final existingItem = cartItems[existingIndex];
      cartItems[existingIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + item.quantity);
    } else {
      // Add new item
      cartItems.add(item);
    }

    await saveCartItems(cartItems);
  }

  // Remove item from cart
  Future<void> removeFromCart(String itemId) async {
    final cartItems = getCartItems();
    cartItems.removeWhere((item) => item.id == itemId);
    await saveCartItems(cartItems);
  }

  // Update item quantity
  Future<void> updateItemQuantity(String itemId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(itemId);
      return;
    }

    final cartItems = getCartItems();
    final index = cartItems.indexWhere((item) => item.id == itemId);

    if (index >= 0) {
      cartItems[index] = cartItems[index].copyWith(quantity: quantity);
      await saveCartItems(cartItems);
    }
  }

  // Clear cart
  Future<void> clearCart() async {
    await _storage.remove(_cartKey);
  }
}
