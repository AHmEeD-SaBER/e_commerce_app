import 'dart:convert';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final String thumbnail;
  final double price;
  final int quantity;
  final Map<String, String> selectedAttributes;
  final double sale;
  final String brandId;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.quantity,
    required this.selectedAttributes,
    required this.sale,
    required this.brandId,
  });

  // Calculate the total price for this item
  double get totalPrice => (price * (1 - sale / 100)) * quantity;

  // Create a copy of this cart item with updated fields
  CartItem copyWith({
    String? id,
    String? productId,
    String? title,
    String? thumbnail,
    double? price,
    int? quantity,
    Map<String, String>? selectedAttributes,
    double? sale,
    String? brandId,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      selectedAttributes: selectedAttributes ?? this.selectedAttributes,
      sale: sale ?? this.sale,
      brandId: brandId ?? this.brandId,
    );
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'quantity': quantity,
      'selectedAttributes': selectedAttributes,
      'sale': sale,
      'brandId': brandId,
    };
  }

  // Create from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      selectedAttributes: Map<String, String>.from(json['selectedAttributes']),
      sale: json['sale'].toDouble(),
      brandId: json['brandId'],
    );
  }

  // Generate a unique ID for a cart item based on product ID and selected attributes
  static String generateId(String productId, Map<String, String> attributes) {
    final attributesString = json.encode(attributes);
    return '$productId-$attributesString';
  }
}
